import 'package:flutter/material.dart';

class BelajarState extends StatefulWidget {
  const BelajarState({super.key});

  @override
  State<BelajarState> createState() => _BelajarStateState();

}

class _BelajarStateState extends State<BelajarState> {
  bool _isSaldoVisible = true;  // state untuk toggle saldo

  final List<Map<String, String>> _transactions = [
    {'name': 'Tokopedia', 'amount': '-Rp 150.000'},
    {'name': 'GoPay Top Up', 'amount': '+Rp 200.000'},
    {'name': 'Indomaret', 'amount': '-Rp 25.000'},
    {'name': 'Transfer ke Ani', 'amount': '-Rp 500.000'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BCA Mobile'),
        actions: [
          IconButton(
              icon: const Icon(Icons.notifications_outlined),
              onPressed: () {}
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Header salam
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Selamat pagi, Budi 👋',
                    style: TextStyle(fontSize: 16, color: Colors.grey)),
                const SizedBox(height: 4),
                const Text('Saldo Rekening',
                    style: TextStyle(fontSize: 14, color: Colors.grey)),
                const SizedBox(height: 4),

                // 2. Row saldo + tombol toggle
                Row(
                  children: [
                    Text(
                      _isSaldoVisible ? 'Rp 1.250.000' : '••••••••',
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => setState(() => _isSaldoVisible = !_isSaldoVisible),
                      child: Icon(
                        _isSaldoVisible ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // 3. Divider
          const Divider(height: 1),

          // 4. Row 4 menu ikon
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                _MenuIcon(icon: Icons.swap_horiz, label: 'Transfer'),
                _MenuIcon(icon: Icons.account_balance_wallet, label: 'Top Up'),
                _MenuIcon(icon: Icons.payment, label: 'Bayar'),
                _MenuIcon(icon: Icons.more_horiz, label: 'Lainnya'),
              ],
            ),
          ),

          // 5. List transaksi
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Transaksi Terakhir',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _transactions.length,
              itemBuilder: (context, index) {
                final trx = _transactions[index];
                return ListTile(
                  title: Text(trx['name']!),
                  trailing: Text(trx['amount']!,
                      style: TextStyle(
                        color: trx['amount']!.startsWith('+')
                            ? Colors.green
                            : Colors.red,
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  const _MenuIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.blue),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}