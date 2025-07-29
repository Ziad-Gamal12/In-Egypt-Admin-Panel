import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomErrorWidget.dart';
import 'package:in_egypt_admin_panel/core/widgets/EmptyWidget.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/manager/bookings_cubit/bookings_cubit.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/CustomBookingsHeader.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/CustomBookingsSearchAndFilterWidget.dart';
import 'package:in_egypt_admin_panel/features/Bookings/presentation/views/widgets/CustomBookingsSliverGrid.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BookingsViewBody extends StatefulWidget {
  const BookingsViewBody({super.key});

  @override
  State<BookingsViewBody> createState() => _BookingsViewBodyState();
}

class _BookingsViewBodyState extends State<BookingsViewBody> {
  List<BookingEntity> fetchedBookings = [];
  List<BookingEntity> searchedBookings = [];
  bool isLoadMore = true;
  bool issearching = false;
  String searchKeyWord = '';
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    context.read<BookingsCubit>().getBookings(isPaginated: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.addListener(() {
        if (scrollController.position.pixels >=
                scrollController.position.maxScrollExtent - 200 &&
            isLoadMore) {
          if (issearching) {
            context.read<BookingsCubit>().getSearchedBookings(
              searchKey: searchKeyWord,
              isPaginated: true,
            );
          } else {
            context.read<BookingsCubit>().getBookings(isPaginated: true);
          }
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookingsCubit, BookingsState>(
      listener: (context, state) {
        if (state is BookingsGetBookingsSuccess) {
          if (!isLoadMore && state.response.hasMore) return;
          setState(() {
            if (state.response.bookings.isNotEmpty) {
              fetchedBookings.addAll(state.response.bookings);
            }
            isLoadMore = state.response.hasMore;
          });
        } else if (state is BookingsGetSearchBookingsSuccess) {
          if (!isLoadMore && state.response.hasMore) return;
          setState(() {
            if (state.response.bookings.isNotEmpty) {
              searchedBookings.addAll(state.response.bookings);
            }
            isLoadMore = state.response.hasMore;
          });
        }
      },
      builder: (context, state) {
        if (state is BookingsGetBookingsFailure) {
          return Center(child: CustomErrorWidget(message: state.errmessage));
        }
        if (state is BookingsGetSearchBookingsFailure) {
          return Center(child: CustomErrorWidget(message: state.errmessage));
        }
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kHorizentalPadding,
            vertical: kVerticalPadding,
          ),
          child: Skeletonizer(
            enabled: state is BookingsGetBookingsLoading,
            child: LayoutBuilder(
              builder: (context, constraints) => CustomScrollView(
                controller: scrollController,
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomBookingsSearchAndFilterWidget(
                          isSearching: (val) {
                            setState(() {
                              issearching = val;
                            });
                          },
                          searchKeyWord: (keyWord) {
                            setState(() {
                              searchKeyWord = keyWord;
                              searchedBookings.clear();
                              isLoadMore = true;
                            });
                          },
                        ),
                        SizedBox(height: 20),
                        CustomBookingsHeader(),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  if (state is BookingsGetSearchBookingsLoading)
                    SliverToBoxAdapter(
                      child: Center(
                        child: CircularProgressIndicator(color: kMainColor),
                      ),
                    )
                  else if (issearching && searchedBookings.isEmpty)
                    SliverToBoxAdapter(child: EmptyWidget())
                  else if (issearching)
                    CustomBookingsSliverGrid(
                      maxWidth: constraints.maxWidth,
                      bookings: searchedBookings,
                    )
                  else if (!issearching && fetchedBookings.isEmpty)
                    SliverToBoxAdapter(child: EmptyWidget())
                  else
                    CustomBookingsSliverGrid(
                      maxWidth: constraints.maxWidth,
                      bookings: fetchedBookings,
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
