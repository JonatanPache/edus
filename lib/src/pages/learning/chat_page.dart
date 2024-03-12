// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
// import 'package:web_socket_channel/io.dart';
//
// class ChatPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return ChatPageState();
//   }
// }
//
// class ChatPageState extends State<ChatPage> {
//   IOWebSocketChannel? channel; //channel varaible for websocket
//   bool? connected; // boolean value to track connection status
//
//   String myid = "222"; //my id
//   String recieverid = "111"; //reciever id
//   // swap myid and recieverid value on another mobile to test send and recieve
//   String auth = "chatapphdfgjd34534hjdfk"; //auth key
//
//   List<MessageData> msglist = [];
//
//   TextEditingController msgtext = TextEditingController();
//   late ChatGPTApi _api;
//
//   @override
//   void initState() {
//     connected = false;
//     msgtext.text = "";
//     channelconnect();
//     super.initState();
//     _api = ChatGPTApi(
//       sessionToken:
//       'eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..Y_4c3HQgcgNxOn-Y.ghbFbZ27moPChKlapi6p6TEqy4uHqQ9lexWwG1eO47KouZDkCxO5dDyh-3MkyQtmCeTQvBDlWoGp_supPiwOC8uv31dlUEuMw3ILuTZ-ZVlWvaGpGRbMIPkt_hxvv6Zf_pL_mJGL84-1KOrRR1F3urkTvfaXsxoboehgEFcIJ81vrvJ4XmAzEJn0K3BzSavPBZuqS8cXuFACi87wMht1DTjY4XOvJYBiVWn29765_-amcgIpH56ThmZfowgDA4Fcw81KjuZjwBTGg5pHfNmFxkcYSBsZZawT2Z4RKssKj-tBzfCzBTVjCk_RNfMppemN46FF0Ewt9D11Bulnj1-HVPYQDK2JtQVeL1XGbqQ8TvU9f1dOt-xEWd80NL1s5jbkR8paboXddjp8QGW0b4MzX8jQFGIgUtcKD9zEq7uhe7mXDBuRshGPaY53xbjRjdOBbJg-NwRsOtcOvfq6G8m8Iv6a3YM5QfKaV-irlZ_SYJ9E2a0AamjAOEmq45CpYPoxMdINdHquRRvj4bzjeKhwLpz7Rkw-DYwp8dxjEE51xJXB3e_sw_SOT9sJxptaitGcy9JLBaNhKRjA2QIHZyYMKpWlJ9K0Lw63b-B6EnUJIWE7h0F2Y4tqdxoYmsx_eY-FZjzzcG3rVLJaDFJHz-FvLfDqTzXWkNkwAM6Qi98JBtXBvc-Yi9kzeOmkSurOtDj1mJPwYAmqd3-PUUS-XRR9RmQUGq-3S0NOipRZ69PjmVPRdefY8dl30YyQpn4EnkR7koek5tSfol4dHYnmivtwpuJPeyd9W9anqwRlOF3a9yIa_jH78_nAqMUnpWiSKs52NkpRxKDhDbwFdvngbYThbv2m5jtCxDZqwkpe00apO4odS8r-i8YFSMWgVZLX1SdYcOBbTdcF7XrsA1vk3finyU_yp-dP9gG_0xgIXgwgnOGCMpYHE-x4Wk8Z2LT1pr9HUTIz-RDdHtbxyNTVjM-fWUAyLoFffr2ohjgHh3hTS8qT5cq9rQO9Zu8HtaOFMFFpDpm1Hmf4UPbuD4-Q9J3LoSuapsxUx8gwmfR19wehZUJc-N69Yt5uW6Li2NnCWea3_k_JwK5zaC1Ra5P_UiwSZQDIWDLp-1vmIrE86M6EKzaOly2nTJhmQhgHvCf1qReAGoBP3XX-2QmlMhbsemBjS99IkJOyZwht9fBu1UyKRiH-_dVVBSB0h9rHhMjePjxmc1F0vEY8Wad8UgOxaXhHBxoR3psi6fGp-jaIcuCo115QvzR9YjRaMNTtynmM7CJm70sQ2IFzp7y07XzNce5iIrwJNP07HvVjLXe60yuVtuPtdpPUhWRmHtY7PRFXeX5DNsKWS678_Q4hFBC0DFu9xbI_GWmWB7mmIdOHi4IMP8Aza9e0zM8gtv7D9X9u_kCGMSvlyi7rQHVdUAAvwZXkkQl4A7CWh_UfesjVvGH8u6Hxaq9Rj990Nwbe1VMjQyqumMH9KmhJRG1jFVDfQVKjKu9f6H2gkDWISPsgC4DpuH8uqLbE3RqiRAAsBrKvrKb_5Bmf_ZWDdnXIVW4PslR73ly-17Fu5KeXbKs10LUpotHmU0Cy62EfwcD4LEOqO3ZK9K0Ed3_alQggPI_kWybTdtLnK3vxKaWrRufkW7ArnQ1DWLBPaook8D_zUoBjXvEZFU2Y-PNdlOz5AnB1VzSt4afEf8HjVQDduGGECXucXU9Q6Mqj_eGZ8F9EYVAmKdkkH2R_mWfIDPWYzYcKJahSuryHYDOpnYsGshK5xtlm1TNt153_d-DKNejwUCNv6XlwAK4B2KVqQIxjsJYu5k5oPap_WT0vRPDlBYEJxPFDPrWwpgbYpYYhxr86bvS3P8Q9sBmNcqy_PNyce5mKs6MnvJWQnarqKjOA7D7UW1CqFciFSrXpbpUfuyTAoa_rpRvRBtP3i3d_w1O6wfD7pmPwisObRlM7WI9J-zIUfQkDidXZMJAs-k6SplK6FndqKRZuPm7BwA23HgvrPJ9Q9Wb48Btld8am1jb19OSjHFKNRz56nf8MNNUgW6lw9sBe-_tK3Y8D6_IDOB0MhMkkjhhKs7iXUJ_hA34ye-kz8k-6nhlF2NzQ8q9DgHUS2aKlk8ATq2xSoNs-gMcsAD9GXPPJvrLQep_k4tCpE-OkoLPY36-vlOKZE0I2CfLo6vNt1ip-lXftP-ZNIEWwa8IrSA89lku5iV4Ih4V4X-SWheSNDVoHsII6zkauLeBXAk8MPgm5DIkBtvzeP1qSbcttAzCRvAL5Yz3n2BregsU_bUhpRtnsqPDeTL-xo-AcSaGTfSVryFNNScPBaHaGJvgGnCAhwtmCG6ag7uehF6phTGm55Uzq_4TqiwFSuCahshTsmXQMj5YPxPcszxDtHplogM_e_06j2bhxu8uN75rOu9ZtsB_Iq9ErJDQWFgFftIADEyphMEh_V-scSE1b97KHFdzqOIZ0zy-XetLRoDjqVd86VHU5F-fQVGK-w1SB6KxiYAvo22YOUctGzGizx55n854WE7pMmPzenZOT4bZMSn8yZkUbFtXtTY1x7Ipg5OqLGbYFudtjt-l3ENEJ21IB_WpPzBxy.la8bPxOubc_hinAxF6nvOQ',
//       clearanceToken: '',
//     );
//   }
//
//   channelconnect() {
//     //function to connect
//     try {
//       channel = IOWebSocketChannel.connect(
//           "ws://192.168.0.109:6060/$myid"); //channel IP : Port
//       channel!.stream.listen(
//             (message) {
//           print(message);
//           setState(() {
//             if (message == "connected") {
//               connected = true;
//               setState(() {});
//               print("Connection establised.");
//             } else if (message == "send:success") {
//               print("Message send success");
//               setState(() {
//                 msgtext.text = "";
//               });
//             } else if (message == "send:error") {
//               print("Message send error");
//             } else if (message.substring(0, 6) == "{'cmd'") {
//               print("Message data");
//               message = message.replaceAll(RegExp("'"), '"');
//               var jsondata = json.decode(message);
//
//               msglist.add(MessageData(
//                 //on message recieve, add data to model
//                 msgtext: jsondata["msgtext"],
//                 userid: jsondata["userid"],
//                 isme: false,
//               ));
//               setState(() {
//                 //update UI after adding data to message model
//               });
//             }
//           });
//         },
//         onDone: () {
//           //if WebSocket is disconnected
//           print("Web socket is closed");
//           setState(() {
//             connected = false;
//           });
//         },
//         onError: (error) {
//           print(error.toString());
//         },
//       );
//     } catch (_) {
//       print("error on connecting to websocket.");
//     }
//   }
//
//   Future<void> sendmsg(String sendmsg, String id) async {
//     if (connected == true) {
//       String msg =
//           "{'auth':'$auth','cmd':'send','userid':'$id', 'msgtext':'$sendmsg'}";
//       setState(() {
//         msgtext.text = "";
//         msglist.add(MessageData(msgtext: sendmsg, userid: myid, isme: true));
//       });
//       channel!.sink.add(msg); //send message to reciever channel
//     } else {
//       channelconnect();
//       print("Websocket is not connected.");
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("My ID: $myid - Chat App Example"),
//           leading: Icon(Icons.circle,
//               color: connected! ? Colors.greenAccent : Colors.redAccent),
//           //if app is connected to node.js then it will be gree, else red.
//           titleSpacing: 0,
//         ),
//         body: Container(
//             child: Stack(
//               children: [
//                 Positioned(
//                     top: 0,
//                     bottom: 70,
//                     left: 0,
//                     right: 0,
//                     child: Container(
//                         padding: EdgeInsets.all(15),
//                         child: SingleChildScrollView(
//                             child: Column(
//                               children: [
//                                 Container(
//                                   child: Text("Your Messages",
//                                       style: TextStyle(fontSize: 20)),
//                                 ),
//                                 Container(
//                                     child: Column(
//                                       children: msglist.map((onemsg) {
//                                         return Container(
//                                             margin: EdgeInsets.only(
//                                               //if is my message, then it has margin 40 at left
//                                               left: onemsg.isme! ? 40 : 0,
//                                               right: onemsg.isme!
//                                                   ? 0
//                                                   : 40, //else margin at right
//                                             ),
//                                             child: Card(
//                                                 color: onemsg.isme!
//                                                     ? Colors.blue[100]
//                                                     : Colors.red[100],
//                                                 //if its my message then, blue background else red background
//                                                 child: Container(
//                                                   width: double.infinity,
//                                                   padding: EdgeInsets.all(15),
//                                                   child: Column(
//                                                     crossAxisAlignment:
//                                                     CrossAxisAlignment.start,
//                                                     children: [
//                                                       Container(
//                                                           child: Text(onemsg.isme!
//                                                               ? "ID: ME"
//                                                               : "ID: " + onemsg.userid!)),
//                                                       Container(
//                                                         margin: EdgeInsets.only(
//                                                             top: 10, bottom: 10),
//                                                         child: Text(
//                                                             "Message: " + onemsg.msgtext!,
//                                                             style: TextStyle(fontSize: 17)),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 )));
//                                       }).toList(),
//                                     ))
//                               ],
//                             )))),
//                 Positioned(
//                   //position text field at bottom of screen
//
//                   bottom: 0, left: 0, right: 0,
//                   child: Container(
//                       color: Colors.black12,
//                       height: 70,
//                       child: Row(
//                         children: [
//                           Expanded(
//                               child: Container(
//                                 margin: EdgeInsets.all(10),
//                                 child: TextField(
//                                   controller: msgtext,
//                                   decoration: InputDecoration(hintText: "Enviar un mensaje"),
//                                 ),
//                               )),
//                           Container(
//                               margin: EdgeInsets.all(10),
//                               child: ElevatedButton(
//                                 child: Icon(Icons.send),
//                                 onPressed: () {
//                                   if (msgtext.text != "") {
//                                     sendmsg(msgtext.text,
//                                         recieverid); //send message with webspcket
//                                   } else {
//                                     print("Enter message");
//                                   }
//                                 },
//                               ))
//                         ],
//                       )),
//                 )
//               ],
//             )));
//   }
// }
//
// class MessageData {
//   //message data model
//   String? msgtext, userid;
//   bool? isme;
//   MessageData({this.msgtext, this.userid, this.isme});
// }
