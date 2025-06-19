import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:khata_tracker/shared/models/debt_model.dart';

class PdfService {
  static Future<void> generateAndShareDebtsPdf(
    List<Debt> debts,
    String title,
  ) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Header(level: 0, child: pw.Text(title)),
              pw.SizedBox(height: 20),
              pw.Table.fromTextArray(
                context: context,
                data: _buildTableData(debts),
                headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                cellAlignment: pw.Alignment.centerLeft,
              ),
            ],
          );
        },
      ),
    );

    await Printing.sharePdf(
      bytes: await pdf.save(),
      filename: 'khata_tracker_${DateTime.now().toIso8601String()}.pdf',
    );
  }

  static List<List<String>> _buildTableData(List<Debt> debts) {
    final List<List<String>> data = [
      ['Person', 'Type', 'Amount', 'Date', 'Status', 'Notes'],
    ];

    for (final debt in debts) {
      data.add([
        debt.person,
        debt.type,
        debt.formattedAmount,
        debt.date.toString().split(' ')[0],
        debt.status,
        debt.notes ?? '',
      ]);
    }

    return data;
  }
}
