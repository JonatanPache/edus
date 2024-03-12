// import 'package:flutter/material.dart';
// import 'package:flutter_chatgpt_api/flutter_chatgpt_api.dart';
//
// const backgroundColor = Color(0xff343541);
// const botBackgroundColor = Color(0xff444654);
//
// class ChatV2 extends StatefulWidget {
//   const ChatV2({super.key});
//
//   @override
//   State<ChatV2> createState() => _ChatV2State();
// }
//
// class _ChatV2State extends State<ChatV2> {
//   final _textController = TextEditingController();
//   final _scrollController = ScrollController();
//   final List<ChatMessage> _messages = [];
//   late ChatGPTApi _api;
//
//   String? _parentMessageId;
//   String? _conversationId;
//   late bool isLoading;
//
//   @override
//   void initState() {
//     super.initState();
//     _api = ChatGPTApi(
//       sessionToken:'eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..Y_4c3HQgcgNxOn-Y.ghbFbZ27moPChKlapi6p6TEqy4uHqQ9lexWwG1eO47KouZDkCxO5dDyh-3MkyQtmCeTQvBDlWoGp_supPiwOC8uv31dlUEuMw3ILuTZ-ZVlWvaGpGRbMIPkt_hxvv6Zf_pL_mJGL84-1KOrRR1F3urkTvfaXsxoboehgEFcIJ81vrvJ4XmAzEJn0K3BzSavPBZuqS8cXuFACi87wMht1DTjY4XOvJYBiVWn29765_-amcgIpH56ThmZfowgDA4Fcw81KjuZjwBTGg5pHfNmFxkcYSBsZZawT2Z4RKssKj-tBzfCzBTVjCk_RNfMppemN46FF0Ewt9D11Bulnj1-HVPYQDK2JtQVeL1XGbqQ8TvU9f1dOt-xEWd80NL1s5jbkR8paboXddjp8QGW0b4MzX8jQFGIgUtcKD9zEq7uhe7mXDBuRshGPaY53xbjRjdOBbJg-NwRsOtcOvfq6G8m8Iv6a3YM5QfKaV-irlZ_SYJ9E2a0AamjAOEmq45CpYPoxMdINdHquRRvj4bzjeKhwLpz7Rkw-DYwp8dxjEE51xJXB3e_sw_SOT9sJxptaitGcy9JLBaNhKRjA2QIHZyYMKpWlJ9K0Lw63b-B6EnUJIWE7h0F2Y4tqdxoYmsx_eY-FZjzzcG3rVLJaDFJHz-FvLfDqTzXWkNkwAM6Qi98JBtXBvc-Yi9kzeOmkSurOtDj1mJPwYAmqd3-PUUS-XRR9RmQUGq-3S0NOipRZ69PjmVPRdefY8dl30YyQpn4EnkR7koek5tSfol4dHYnmivtwpuJPeyd9W9anqwRlOF3a9yIa_jH78_nAqMUnpWiSKs52NkpRxKDhDbwFdvngbYThbv2m5jtCxDZqwkpe00apO4odS8r-i8YFSMWgVZLX1SdYcOBbTdcF7XrsA1vk3finyU_yp-dP9gG_0xgIXgwgnOGCMpYHE-x4Wk8Z2LT1pr9HUTIz-RDdHtbxyNTVjM-fWUAyLoFffr2ohjgHh3hTS8qT5cq9rQO9Zu8HtaOFMFFpDpm1Hmf4UPbuD4-Q9J3LoSuapsxUx8gwmfR19wehZUJc-N69Yt5uW6Li2NnCWea3_k_JwK5zaC1Ra5P_UiwSZQDIWDLp-1vmIrE86M6EKzaOly2nTJhmQhgHvCf1qReAGoBP3XX-2QmlMhbsemBjS99IkJOyZwht9fBu1UyKRiH-_dVVBSB0h9rHhMjePjxmc1F0vEY8Wad8UgOxaXhHBxoR3psi6fGp-jaIcuCo115QvzR9YjRaMNTtynmM7CJm70sQ2IFzp7y07XzNce5iIrwJNP07HvVjLXe60yuVtuPtdpPUhWRmHtY7PRFXeX5DNsKWS678_Q4hFBC0DFu9xbI_GWmWB7mmIdOHi4IMP8Aza9e0zM8gtv7D9X9u_kCGMSvlyi7rQHVdUAAvwZXkkQl4A7CWh_UfesjVvGH8u6Hxaq9Rj990Nwbe1VMjQyqumMH9KmhJRG1jFVDfQVKjKu9f6H2gkDWISPsgC4DpuH8uqLbE3RqiRAAsBrKvrKb_5Bmf_ZWDdnXIVW4PslR73ly-17Fu5KeXbKs10LUpotHmU0Cy62EfwcD4LEOqO3ZK9K0Ed3_alQggPI_kWybTdtLnK3vxKaWrRufkW7ArnQ1DWLBPaook8D_zUoBjXvEZFU2Y-PNdlOz5AnB1VzSt4afEf8HjVQDduGGECXucXU9Q6Mqj_eGZ8F9EYVAmKdkkH2R_mWfIDPWYzYcKJahSuryHYDOpnYsGshK5xtlm1TNt153_d-DKNejwUCNv6XlwAK4B2KVqQIxjsJYu5k5oPap_WT0vRPDlBYEJxPFDPrWwpgbYpYYhxr86bvS3P8Q9sBmNcqy_PNyce5mKs6MnvJWQnarqKjOA7D7UW1CqFciFSrXpbpUfuyTAoa_rpRvRBtP3i3d_w1O6wfD7pmPwisObRlM7WI9J-zIUfQkDidXZMJAs-k6SplK6FndqKRZuPm7BwA23HgvrPJ9Q9Wb48Btld8am1jb19OSjHFKNRz56nf8MNNUgW6lw9sBe-_tK3Y8D6_IDOB0MhMkkjhhKs7iXUJ_hA34ye-kz8k-6nhlF2NzQ8q9DgHUS2aKlk8ATq2xSoNs-gMcsAD9GXPPJvrLQep_k4tCpE-OkoLPY36-vlOKZE0I2CfLo6vNt1ip-lXftP-ZNIEWwa8IrSA89lku5iV4Ih4V4X-SWheSNDVoHsII6zkauLeBXAk8MPgm5DIkBtvzeP1qSbcttAzCRvAL5Yz3n2BregsU_bUhpRtnsqPDeTL-xo-AcSaGTfSVryFNNScPBaHaGJvgGnCAhwtmCG6ag7uehF6phTGm55Uzq_4TqiwFSuCahshTsmXQMj5YPxPcszxDtHplogM_e_06j2bhxu8uN75rOu9ZtsB_Iq9ErJDQWFgFftIADEyphMEh_V-scSE1b97KHFdzqOIZ0zy-XetLRoDjqVd86VHU5F-fQVGK-w1SB6KxiYAvo22YOUctGzGizx55n854WE7pMmPzenZOT4bZMSn8yZkUbFtXtTY1x7Ipg5OqLGbYFudtjt-l3ENEJ21IB_WpPzBxy.la8bPxOubc_hinAxF6nvOQ',
//       clearanceToken: 'oXd8G7Rbu3HHWgVoAP5fIzWRljP_CgEVew67c5wjYks-1682627131-0-1-9f8fa514.570bcc78.c88efaf4-160',
//     );
//     isLoading = false;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         toolbarHeight: 100,
//         title: const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Text(
//             'Flutter ChatGPT API Example @coskuncay',
//             maxLines: 2,
//             textAlign: TextAlign.center,
//           ),
//         ),
//         backgroundColor: botBackgroundColor,
//       ),
//       backgroundColor: backgroundColor,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: _buildList(),
//             ),
//             Visibility(
//               visible: isLoading,
//               child: const Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: CircularProgressIndicator(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   _buildInput(),
//                   _buildSubmit(),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSubmit() {
//     return Visibility(
//       visible: !isLoading,
//       child: Container(
//         color: botBackgroundColor,
//         child: IconButton(
//           icon: const Icon(
//             Icons.send_rounded,
//             color: Color.fromRGBO(142, 142, 160, 1),
//           ),
//           onPressed: () async {
//             setState(
//                   () {
//                 _messages.add(
//                   ChatMessage(
//                     text: _textController.text,
//                     chatMessageType: ChatMessageType.user,
//                   ),
//                 );
//                 isLoading = true;
//               },
//             );
//             var input = _textController.text;
//             _textController.clear();
//             Future.delayed(const Duration(milliseconds: 50))
//                 .then((_) => _scrollDown());
//             var newMessage = await _api.sendMessage(
//               input,
//               conversationId: _conversationId,
//               parentMessageId: _parentMessageId,
//             );
//             setState(() {
//               _conversationId = newMessage.conversationId;
//               _parentMessageId = newMessage.messageId;
//               isLoading = false;
//               _messages.add(
//                 ChatMessage(
//                   text: newMessage.message,
//                   chatMessageType: ChatMessageType.bot,
//                 ),
//               );
//             });
//             _textController.clear();
//             Future.delayed(const Duration(milliseconds: 50))
//                 .then((_) => _scrollDown());
//           },
//         ),
//       ),
//     );
//   }
//
//   Expanded _buildInput() {
//     return Expanded(
//       child: TextField(
//         textCapitalization: TextCapitalization.sentences,
//         style: const TextStyle(color: Colors.white),
//         controller: _textController,
//         decoration: const InputDecoration(
//           fillColor: botBackgroundColor,
//           filled: true,
//           border: InputBorder.none,
//           focusedBorder: InputBorder.none,
//           enabledBorder: InputBorder.none,
//           errorBorder: InputBorder.none,
//           disabledBorder: InputBorder.none,
//         ),
//       ),
//     );
//   }
//
//   ListView _buildList() {
//     return ListView.builder(
//       controller: _scrollController,
//       itemCount: _messages.length,
//       itemBuilder: (context, index) {
//         var message = _messages[index];
//         return ChatMessageWidget(
//           text: message.text,
//           chatMessageType: message.chatMessageType,
//         );
//       },
//     );
//   }
//
//   void _scrollDown() {
//     _scrollController.animateTo(
//       _scrollController.position.maxScrollExtent,
//       duration: const Duration(milliseconds: 300),
//       curve: Curves.easeOut,
//     );
//   }
// }
//
// class ChatMessageWidget extends StatelessWidget {
//   const ChatMessageWidget(
//       {super.key, required this.text, required this.chatMessageType});
//
//   final String text;
//   final ChatMessageType chatMessageType;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10.0),
//       padding: const EdgeInsets.all(16),
//       color: chatMessageType == ChatMessageType.bot
//           ? botBackgroundColor
//           : backgroundColor,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           chatMessageType == ChatMessageType.bot
//               ? Container(
//             margin: const EdgeInsets.only(right: 16.0),
//             child: CircleAvatar(
//               backgroundColor: const Color.fromRGBO(16, 163, 127, 1),
//               child: Image.asset(
//                 'assets/bot.png',
//                 color: Colors.white,
//                 scale: 1.5,
//               ),
//             ),
//           )
//               : Container(
//             margin: const EdgeInsets.only(right: 16.0),
//             child: const CircleAvatar(
//               child: Icon(
//                 Icons.person,
//               ),
//             ),
//           ),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Container(
//                   padding: const EdgeInsets.all(8.0),
//                   decoration: const BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                   ),
//                   child: Text(
//                     text,
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodyLarge
//                         ?.copyWith(color: Colors.white),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }