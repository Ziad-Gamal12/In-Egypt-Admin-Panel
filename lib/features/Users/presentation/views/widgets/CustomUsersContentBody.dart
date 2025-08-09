import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/constant.dart';
import 'package:in_egypt_admin_panel/core/widgets/CustomErrorWidget.dart';
import 'package:in_egypt_admin_panel/features/Auth/domain/Entities/UserEntity.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/manager/UsersCubit/UsersCubit.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/widgets/CustomUsersHeader.dart';
import 'package:in_egypt_admin_panel/features/Users/presentation/views/widgets/CustomUsersSliverList.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomUsersContentBody extends StatefulWidget {
  const CustomUsersContentBody({super.key});

  @override
  State<CustomUsersContentBody> createState() => _CustomUsersContentBodyState();
}

class _CustomUsersContentBodyState extends State<CustomUsersContentBody> {
  late ScrollController scrollController;
  bool isLoadMore = true;
  List<UserEntity> fetchedUsers = [];
  @override
  void initState() {
    scrollController = ScrollController();
    context.read<UsersCubit>().getUsers(isPaginated: false);
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent - 200) {
        context.read<UsersCubit>().getUsers(isPaginated: true);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UsersCubit, UsersState>(
      listener: (context, state) {
        if (state is UsersGetUsersSuccess) {
          if (!isLoadMore && state.response.hasMore) return;
          setState(() {
            fetchedUsers.addAll(state.response.usersList);
            isLoadMore = state.response.hasMore;
          });
        }
      },
      builder: (context, state) {
        if (state is UsersGetUsersFailure) {
          return Center(child: CustomErrorWidget(message: state.errMessage));
        }
        bool isLoading = state is UsersGetUsersLoading;
        return Skeletonizer(
          enabled: isLoading,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kHorizentalPadding,
              vertical: kVerticalPadding,
            ),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(child: CustomUsersHeader()),
                    const SliverToBoxAdapter(child: SizedBox(height: 20)),
                    CustomUsersSliverList(
                      width: constraints.maxWidth,
                      users: fetchedUsers,
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
