//
// import 'package:edus/src/pages/openAI/model/chat_message.dart';
// import 'package:edus/src/pages/openAI/repository/chat_api.dart';
// import 'package:edus/src/pages/openAI/widgets/message_bubble.dart';
// import 'package:edus/src/pages/openAI/widgets/message_composer.dart';
// import 'package:flutter/material.dart';
//
// class ChatPage extends StatefulWidget {
//   const ChatPage({
//     required this.chatApi,
//     super.key,
//   });
//
//   final ChatApi chatApi;
//
//   @override
//   State<ChatPage> createState() => _ChatPageState();
// }
//
// class _ChatPageState extends State<ChatPage> {
//   final _messages = <ChatMessage>[
//     ChatMessage('Hola, como puedo ayudarte?', false),
//   ];
//   var _awaitingResponse = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Consultas')),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView(
//               children: [
//                 ..._messages.map(
//                       (msg) => MessageBubble(
//                     content: msg.content,
//                     isUserMessage: msg.isUserMessage,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           MessageComposer(
//             onSubmitted: _onSubmitted,
//             awaitingResponse: _awaitingResponse,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> _onSubmitted(String message) async {
//     setState(() {
//       _messages.add(ChatMessage(message, true));
//       _awaitingResponse = true;
//     });
//     try {
//       // final response = await widget.chatApi.completeChat(_messages);
//       setState(() {
//         _messages.add(ChatMessage(response, false));
//         _awaitingResponse = false;
//       });
//     } catch (err) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('An error occurred. Please try again.')),
//       );
//       setState(() {
//         _awaitingResponse = false;
//       });
//     }
//   }
// }