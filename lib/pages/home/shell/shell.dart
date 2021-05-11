import 'dart:convert';

import 'package:dartssh/client.dart';
import 'package:flutter/material.dart';
import 'package:xterm/flutter.dart';
import 'package:xterm/xterm.dart';

const host = 'ssh://39.99.42.223:22';
const username = 'root';
const password = 'xka123456@';

/// Shell页面
class Shell extends StatefulWidget {
  @override
  _ShellState createState() => _ShellState();
}

class _ShellState extends State<Shell> {
  Terminal terminal;
  SSHClient client;

  @override
  void initState() {
    super.initState();
    terminal = Terminal(onInput: onInput, maxLines: 50);
    connect();
  }

  void connect() {
    terminal.write('connecting $host...');
    client = SSHClient(
      hostport: Uri.parse(host),
      login: username,
      print: print,
      termWidth: 80,
      termHeight: 25,
      termvar: 'xterm-256color',
      getPassword: () => utf8.encode(password),
      response: (transport, data) {
        terminal.write(data);
      },
      success: () {
        terminal.write('connected.\n');
      },
      disconnected: () {
        terminal.write('disconnected.');
      },
    );
  }

  void onInput(String input) {
    client?.sendChannelData(utf8.encode(input));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("123"),
      ),
      body: SizedBox(
        width: 500,
        height: 500,
        child: TerminalView(
          terminal: terminal,
          onResize: (width, height) {
            client?.setTerminalWindowSize(width, height);
          },
        ),
      ),
    );
  }
}
