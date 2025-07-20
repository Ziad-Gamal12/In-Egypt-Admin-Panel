import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:in_egypt_admin_panel/core/Entities/PlaceEntity.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/manager/places_cubit/places_cubit.dart';
import 'package:in_egypt_admin_panel/features/Places/presentation/views/widgets/AddPlaceWidgets/PickPlaceImageListItem.dart';
import 'package:provider/provider.dart';

class AddPlaceImageList extends StatefulWidget {
  const AddPlaceImageList({super.key});

  @override
  State<AddPlaceImageList> createState() => _AddPlaceImageListState();
}

class _AddPlaceImageListState extends State<AddPlaceImageList> {
  @override
  Widget build(BuildContext context) {
    List<String> images = context.read<PlaceEntity>().images;
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .2,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: index == images.length - 1 ? 0 : 10,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      context.read<PlacesCubit>().uploadPlaceImage();
                    },
                    child: PickPlaceImageListItem(
                      imageUrl: images[index],
                      index: index,
                    ),
                  ),
                );
              },
              itemCount: images.length,
            ),
            IconButton(
              onPressed: () {
                images.add('');
                setState(() {});
              },
              icon: Icon(Icons.add, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
