import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_guide_flutter/widgets/app_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const screenRoute = '/filtrasion';

  final Function saveFiltes;

  final Map<String, bool> currentfilters;

  FilterScreen(this.saveFiltes, this.currentfilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _summer = false;
  var _winter = false;
  var _family = false;

  @override
  initState() {
    _summer = widget.currentfilters['summer'] ?? false;
    _winter = widget.currentfilters['winter'] ?? false;
    _family = widget.currentfilters['family'] ?? false;

    super.initState();
  }

  Widget BuildSwitchListTile(String Title, String subtitle, var currentValue,
      ValueChanged<bool> updateValue) {
    return SwitchListTile(
      title: Text(Title),
      subtitle: Text(subtitle),
      value: currentValue,
      onChanged: updateValue,
      activeColor: Colors.amber,
      activeTrackColor: Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          title: Text(
            'Page de filtration',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  final selectedfilters = {
                    'summer': _summer,
                    'winter': _winter,
                    'family': _family,
                  };
                  widget.saveFiltes(selectedfilters);
                })
          ],
        ),
        drawer: AppDrawer(),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView(
              children: [
                BuildSwitchListTile(
                  "Voyages d’été",
                  "Afficher uniquement les voyages en été",
                  _summer,
                  (newValue) {
                    setState(() {
                      _summer = newValue;
                    });
                  },
                ),
                BuildSwitchListTile(
                  "Voyages d’hiver",
                  "Afficher uniquement les voyages en hiver",
                  _winter,
                  (newValue) {
                    setState(() {
                      _winter = newValue;
                    });
                  },
                ),
                BuildSwitchListTile(
                  "Voyages en famille",
                  "Afficher les voyages adaptés aux familles",
                  _family,
                  (newValue) {
                    setState(() {
                      _family = newValue;
                    });
                  },
                ),
              ],
            ))
          ],
        ));
  }
}
