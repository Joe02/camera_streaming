import 'dart:async';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import './call.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => IndexState();
}

class IndexState extends State<IndexPage> {
  /// create a channelController to retrieve text value
  final _channelController = TextEditingController();

  /// if channel textField is validated to have error
  bool _validateError = false;

  ClientRole _role = ClientRole.Broadcaster;

  @override
  void dispose() {
    // dispose input controller
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Iniciar sessão'),
      ),
      body: Center(
        child: Container(
          color: Colors.grey[300],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: TextField(
                                  controller: _channelController,
                                  decoration: InputDecoration(
                                    suffixIcon: InkWell(
                                      child: Icon(Icons.clear),
                                      onTap: () {
                                        _channelController.clear();
                                      },
                                    ),
                                    errorText:
                                    _validateError ? 'Esse campo não pode ser vazio' : null,
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(width: 1),
                                    ),
                                    hintText: 'Digite o canal da transmissão',
                                    hintStyle: TextStyle(fontSize: 19)
                                  ),
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text("Entrar na transmissão como :", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w400),),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RaisedButton(
                              color: Theme.of(context).accentColor,
                              onPressed: () {
                                setState(() {
                                  _role = ClientRole.Broadcaster;
                                });
                                onJoin();
                              },
                              child: Text(
                                "Transmissor",
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                            ),
                            RaisedButton(
                              color: Theme.of(context).accentColor,
                              onPressed: () {
                                setState(() {
                                  _role = ClientRole.Audience;
                                });
                                onJoin();
                              },
                              child: Text(
                                "Telespectador",
                                style: TextStyle(fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onJoin() async {
    // update input validation
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty) {
      // await for camera and mic permissions before pushing video page
      await _handleCameraAndMic();
      // push video page with given channel name
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            channelName: _channelController.text,
            role: _role,
          ),
        ),
      );
    }
  }

  Future<void> _handleCameraAndMic() async {
    await PermissionHandler().requestPermissions(
      [PermissionGroup.camera, PermissionGroup.microphone],
    );
  }
}
