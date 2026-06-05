import 'package:flutter/material.dart';

class BelajarState extends StatefulWidget {
  const BelajarState({super.key});

  @override
  State<BelajarState> createState() => _BelajarStateState();
}

class _BelajarStateState extends State<BelajarState> {
  bool _isSaldoVisible = true; // state untuk toogle saldo

  final List<Map<String, String>> _transactions = [
    {'name': 'Tokopedia', 'amount': '-Rp 150.000'},
    {'name': 'Gopay Top Up', 'amount': '+Rp 200.000'},
    {'name': 'Indomaret', 'amount': '-Rp 25.000'},
    {'name': 'Transfer ke Ani ', 'amount': '-Rp 500.000'},
  ];

  final TextEditingController _controller = TextEditingController();
  String _displayText = "Kosong";
  final List<String> _listItems = [];

  void _onSubmit() {
    setState(() {
      _displayText = _controller.text;
      _listItems.add(_controller.text);
      _controller.clear();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BCA Mobile'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Masukkan teks',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: _onSubmit,
              child: const Text('Submit')
          ),
          const SizedBox(height: 16),
          Text(
            'Result : $_displayText',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: _listItems.length,
                  itemBuilder: (context, index){
                    return Text(_listItems[index]);
                  }
              )
          )
        ],
      ),
    );
  }
}