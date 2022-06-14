import 'package:flutter/material.dart';

class NumberListItem extends StatelessWidget {
  const NumberListItem({
    required int number,
    Key? key,
  })  : _number = number,
        _isSkeleton = false,
        super(key: key);

  const NumberListItem.skeleton({
    Key? key,
  })  : _number = -999,
        _isSkeleton = true,
        super(key: key);

  final int _number;
  final bool _isSkeleton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: _backgroundColor,
        border: Border(
          bottom: BorderSide(
            color: _borderColor,
            width: 1,
          ),
        ),
      ),
      child: _isSkeleton ? null : Center(child: Text(_number.toString())),
    );
  }

  Color get _backgroundColor => _isSkeleton ? Colors.grey.withOpacity(0.3) : Colors.white;
  Color get _borderColor => _isSkeleton ? Colors.white : Colors.black.withOpacity(0.2);
}
