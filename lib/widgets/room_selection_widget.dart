import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/providers/socket_provider.dart';

class RoomBottomSheet extends StatefulWidget {
  const RoomBottomSheet({Key? key}) : super(key: key);

  @override
  State<RoomBottomSheet> createState() => _RoomBottomSheetState();
}

class _RoomBottomSheetState extends State<RoomBottomSheet> {
  OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Color(0xffedf6f9)));

  OutlineInputBorder focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(color: Color(0xfffca311)));

  late TextEditingController roomNameController;
  @override
  void initState() {
    roomNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    roomNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(25),
        height: 200,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              cursorColor: const Color(0xfffca311),
              decoration: InputDecoration(
                  hintText: " Enter room name",
                  border: border,
                  focusedBorder: focusedBorder),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.all(15),
                  primary: const Color(0xfffca311)),
              onPressed: () {
                Navigator.pop(context);
                if (FocusScope.of(context).hasFocus &&
                    roomNameController.text.isNotEmpty) {
                  FocusScope.of(context).unfocus();
                  Provider.of<SocketProvider>(context, listen: false)
                      .joinRoom(roomNameController.text);
                }
                // loading(context, mounted);
              },
              child: const SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Join room",
                    textAlign: TextAlign.center,
                  )))
        ]));
  }
}
