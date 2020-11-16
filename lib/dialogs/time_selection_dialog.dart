import 'dart:collection';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TimeSelectionDialog extends StatefulWidget {
  final String errorText;

  const TimeSelectionDialog({Key key, this.errorText}) : super(key: key);

  @override
  _TimeSelectionDialogState createState() => _TimeSelectionDialogState();
}

class _TimeSelectionDialogState extends State<TimeSelectionDialog> {
  String _selectedTime;
  Map<String, bool> _availableTimes = {};
  bool _isLoading = false;

  @override
  void initState() {
    setState(() => _isLoading = true);
    _getAvailableTimes().then((availableTimes) {
      setState(() {
        _availableTimes = availableTimes;
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Select the time",
              style: Theme.of(context).textTheme.headline6,
            ),
            widget.errorText != null
                ? Text(
                    "${widget.errorText}",
                    style: TextStyle(
                      color: Colors.red[900],
                    ),
                  )
                : Container(),
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : _buildTimesTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildTimesTable() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Wrap(
            children: _availableTimes.entries
                .map((entry) => _buildTimeCard(entry.key, entry.value))
                .toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Close"),
              ),
              RaisedButton(
                color: Colors.blue,
                onPressed: _selectedTime != null
                    ? () => Navigator.of(context).pop(_selectedTime)
                    : null,
                child: Text(
                  "Confirm",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      );

  Widget _buildTimeCard(String time, bool isAvailable) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkWell(
          onTap:
              isAvailable ? () => setState(() => _selectedTime = time) : null,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: isAvailable
                  ? (time == _selectedTime ? Colors.lightGreen : Colors.green)
                  : Colors.green[900],
              border: Border.all(
                color:
                    time == _selectedTime ? Colors.black54 : Colors.transparent,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(time),
            ),
          ),
        ),
      );

  Future<Map<String, bool>> _getAvailableTimes() async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection("agenda")
        .doc("delivery_schedule")
        .get();

    Map docData = doc.data();

    Map<String, bool> unorderedTimes =
        Map<String, bool>.from(docData['available_times']);

    Map<String, bool> availableTimes =
        Map.from(SplayTreeMap.from(unorderedTimes));

    return availableTimes;
  }
}
