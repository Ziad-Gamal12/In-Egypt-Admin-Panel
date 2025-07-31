import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/Entities/BookingEntity.dart';
import 'package:in_egypt_admin_panel/core/helpers/ShowSnackBar.dart';
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
  final List<BookingEntity> _allBookings = [];
  final List<BookingEntity> _searchedBookings = [];
  final List<BookingEntity> _filteredBookings = [];

  final ScrollController _scrollController = ScrollController();

  bool _isSearching = false;
  bool _isLoadMore = true;
  String _searchKeyword = '';

  @override
  void initState() {
    super.initState();
    _fetchInitialBookings();
    _setupPaginationListener();
  }

  void _fetchInitialBookings() {
    context.read<BookingsCubit>().getBookings(isPaginated: false);
  }

  void _setupPaginationListener() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.addListener(() {
        final shouldPaginate =
            _scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200;

        if (shouldPaginate && _isLoadMore) {
          final cubit = context.read<BookingsCubit>();
          _isSearching
              ? cubit.getSearchedBookings(
                  searchKey: _searchKeyword,
                  isPaginated: true,
                )
              : cubit.getBookings(isPaginated: true);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BookingsCubit, BookingsState>(
      listener: _handleBookingStates,
      child: BlocBuilder<BookingsCubit, BookingsState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kHorizentalPadding,
              vertical: kVerticalPadding,
            ),
            child: Skeletonizer(
              enabled: state is BookingsGetBookingsLoading,
              child: LayoutBuilder(
                builder: (context, constraints) => CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverToBoxAdapter(child: _buildSearchAndHeader()),
                    _buildContent(constraints, state),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _handleBookingStates(BuildContext context, BookingsState state) {
    if (state is BookingsGetBookingsSuccess) {
      if (!_isLoadMore && state.response.hasMore) return;
      setState(() {
        if (state.response.bookings.isNotEmpty) {
          _allBookings.addAll(state.response.bookings);
        }
        _isLoadMore = state.response.hasMore;
      });
    } else if (state is BookingsGetSearchBookingsSuccess) {
      if (!_isLoadMore && state.response.hasMore) return;
      setState(() {
        if (state.response.bookings.isNotEmpty) {
          _searchedBookings.addAll(state.response.bookings);
        }
        _isLoadMore = state.response.hasMore;
      });
    } else if (state is BookingsGetBookingsFailure ||
        state is BookingsGetSearchBookingsFailure) {
      final message = state is BookingsGetBookingsFailure
          ? state.errmessage
          : (state as BookingsGetSearchBookingsFailure).errmessage;
      ScaffoldMessenger.of(context);
      showErrorSnackBar(context: context, message: message);
    }
  }

  Widget _buildSearchAndHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomBookingsSearchAndFilterWidget(
          onBookingsChanged: (val) => setState(
            () => _filteredBookings
              ..clear()
              ..addAll(val),
          ),
          isSearching: (val) => setState(() => _isSearching = val),
          searchKeyWord: (key) {
            setState(() {
              _searchKeyword = key;
              _searchedBookings.clear();
              _isLoadMore = true;
            });
          },
        ),
        const SizedBox(height: 20),
        const CustomBookingsHeader(),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildContent(BoxConstraints constraints, BookingsState state) {
    if (state is BookingsGetSearchBookingsLoading) {
      return _buildLoading();
    } else if (_isSearching && _searchedBookings.isEmpty) {
      return const SliverToBoxAdapter(child: EmptyWidget());
    } else if (_isSearching && _searchedBookings.isNotEmpty) {
      return CustomBookingsSliverGrid(
        maxWidth: constraints.maxWidth,
        bookings: _searchedBookings,
      );
    } else if (_filteredBookings.isNotEmpty) {
      return CustomBookingsSliverGrid(
        maxWidth: constraints.maxWidth,
        bookings: _filteredBookings,
      );
    } else if (!_isSearching && _allBookings.isEmpty) {
      return const SliverToBoxAdapter(child: EmptyWidget());
    } else {
      return CustomBookingsSliverGrid(
        maxWidth: constraints.maxWidth,
        bookings: _allBookings,
      );
    }
  }

  Widget _buildLoading() {
    return const SliverToBoxAdapter(
      child: Center(child: CircularProgressIndicator(color: kMainColor)),
    );
  }
}
