import 'package:flutter/material.dart';

void main() => runApp(const RakshaGrahaApp());

class RakshaGrahaApp extends StatelessWidget {
  const RakshaGrahaApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'रक्षाग्रह',
    theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.indigo),
    home: const LanguageScreen(),
  );
}

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(child: Padding(
      padding: const EdgeInsets.all(24),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(Icons.auto_awesome, size: 72),
        const SizedBox(height: 16),
        const Text('रक्षाग्रह', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
        const Text('Raksha Graha'),
        const SizedBox(height: 40),
        const Text('भाषा छान्नुहोस्', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
        const SizedBox(height: 20),
        SizedBox(width: double.infinity, child: FilledButton(onPressed: () => _go(context, 'ne'), child: const Text('नेपाली'))),
        const SizedBox(height: 12),
        SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => _go(context, 'en'), child: const Text('English'))),
      ]),
    )),
  );
  void _go(BuildContext c, String lang) => Navigator.pushReplacement(c, MaterialPageRoute(builder: (_) => HomeShell(language: lang)));
}

class HomeShell extends StatefulWidget {
  final String language;
  const HomeShell({super.key, required this.language});
  @override State<HomeShell> createState() => _HomeShellState();
}
class _HomeShellState extends State<HomeShell> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    final ne = widget.language == 'ne';
    final pages = [HomePage(ne: ne), HoroscopePage(ne: ne), ChatPage(ne: ne), StoriesPage(ne: ne), ProfilePage(ne: ne)];
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(selectedIndex: index, onDestinationSelected: (i) => setState(() => index = i), destinations: [
        NavigationDestination(icon: const Icon(Icons.home_outlined), selectedIcon: const Icon(Icons.home), label: ne ? 'Home' : 'Home'),
        NavigationDestination(icon: const Icon(Icons.stars_outlined), label: ne ? 'राशिफल' : 'Horoscope'),
        NavigationDestination(icon: const Icon(Icons.chat_outlined), label: 'Chat'),
        NavigationDestination(icon: const Icon(Icons.auto_stories_outlined), label: ne ? 'Stories' : 'Stories'),
        NavigationDestination(icon: const Icon(Icons.person_outline), label: ne ? 'Profile' : 'Profile'),
      ]),
    );
  }
}

class HomePage extends StatelessWidget {
  final bool ne; const HomePage({super.key, required this.ne});
  @override Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: const Text('रक्षाग्रह'), actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none))]), body: ListView(padding: const EdgeInsets.all(16), children: [
    Text(ne ? 'नमस्ते 🙏 @Name' : 'Hi, @Name', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
    const SizedBox(height: 8), const Text('BS — AD'), const SizedBox(height: 20),
    Card(child: ListTile(leading: const Icon(Icons.auto_awesome), title: Text(ne ? 'रक्षाग्रहमा आज' : 'Raksha Graha Today'), subtitle: Text(ne ? 'आजको विशेष सामग्री' : 'Today’s content'))),
    Card(child: ListTile(leading: const Icon(Icons.stars), title: Text(ne ? 'आजको राशिफल' : 'Today’s Horoscope'))),
    Card(child: ListTile(leading: const Icon(Icons.chat_bubble_outline), title: Text(ne ? 'ज्योतिषसँग कुरा गर्नुहोस्' : 'Talk to an Astrologer'))),
    Card(child: ListTile(leading: const Icon(Icons.child_care), title: Text(ne ? 'Kids Learning' : 'Kids Learning'))),
    Card(child: ListTile(leading: const Icon(Icons.qr_code_scanner), title: Text(ne ? 'QR / Barcode Scanner' : 'QR / Barcode Scanner'))),
  ]));
}
class HoroscopePage extends StatelessWidget { final bool ne; const HoroscopePage({super.key, required this.ne}); @override Widget build(BuildContext c)=>Scaffold(appBar: AppBar(title: Text(ne?'राशिफल':'Horoscope')),body: const Center(child: Text('Horoscope module — ready for Firebase content'))); }
class ChatPage extends StatelessWidget { final bool ne; const ChatPage({super.key, required this.ne}); @override Widget build(BuildContext c)=>Scaffold(appBar: AppBar(title: Text(ne?'ज्योतिषसँग कुरा गर्नुहोस्':'Talk to an Astrologer')),body: Column(children:[const Expanded(child: Center(child: Text('Chat messages will appear here'))),SafeArea(child: Row(children:[IconButton(onPressed:(){},icon:const Icon(Icons.camera_alt)),Expanded(child:TextField(decoration:InputDecoration(hintText:ne?'सन्देश...':'Message...',border:OutlineInputBorder(borderRadius:BorderRadius.circular(24))))),IconButton(onPressed:(){},icon:const Icon(Icons.mic)),IconButton(onPressed:(){},icon:const Icon(Icons.send))]))])); }
class StoriesPage extends StatelessWidget { final bool ne; const StoriesPage({super.key, required this.ne}); @override Widget build(BuildContext c)=>Scaffold(appBar: AppBar(title: Text(ne?'Stories / Posts':'Stories / Posts')),body: ListView(padding:const EdgeInsets.all(16),children:[FilledButton.icon(onPressed:(){},icon:const Icon(Icons.add),label:Text(ne?'Post बनाउनुहोस्':'Create Post')),const SizedBox(height:12),Card(child:ListTile(leading:const Icon(Icons.circle),title:Text(ne?'Daily Story — 24 घण्टा':'Daily Story — 24 hours'),subtitle:Text(ne?'Public / Friends / Only Me':'Public / Friends / Only Me')))])); }
class ProfilePage extends StatelessWidget { final bool ne; const ProfilePage({super.key, required this.ne}); @override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:Text(ne?'Profile':'Profile')),body:ListView(padding:const EdgeInsets.all(16),children:[const CircleAvatar(radius:42,child:Icon(Icons.person,size:44)),const SizedBox(height:12),const Center(child:Text('@username',style:TextStyle(fontSize:20,fontWeight:FontWeight.bold))),const SizedBox(height:20),ListTile(leading:const Icon(Icons.location_on_outlined),title:Text(ne?'काठमाडौं, बागमती':'Kathmandu, Bagmati'),subtitle:Text(ne?'Location privacy setting':'Location privacy')),Wrap(spacing:8,children:[OutlinedButton.icon(onPressed:(){},icon:const Icon(Icons.share),label:Text(ne?'Share':'Share')),OutlinedButton.icon(onPressed:(){},icon:const Icon(Icons.card_giftcard),label:Text(ne?'Refer':'Refer')),OutlinedButton.icon(onPressed:(){},icon:const Icon(Icons.qr_code),label:Text('My QR')),OutlinedButton.icon(onPressed:(){},icon:const Icon(Icons.qr_code_scanner),label:Text('Scan'))]),const Divider(),ListTile(leading:const Icon(Icons.child_care),title:Text(ne?'Kids Learning':'Kids Learning')),ListTile(leading:const Icon(Icons.settings),title:Text(ne?'Settings':'Settings'))])); }
