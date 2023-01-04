import 'package:flutter/material.dart';
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}


class _MyWidgetState extends State<MyWidget> {
  
  final List<ListItem> _fruits = [
    ListItem('honda', 'Honda'),
    ListItem('toyota', 'Toyota'),
    ListItem('isuzu', 'Isuzu'),
  ];

  final List<Type> type = [
    Type('daily', 'รายวัน' , 'daily'),
    Type('monthly', 'รายเดือน','monthly'),
   
  ];

   final List<Cardocument> cardocument = [
    Cardocument('carinsurance', 'ประกันรถยนต์' , 'carinsurance','carinsurance'),
    Cardocument('carbook', 'สมุดรถ','carbook','carbook'),
    Cardocument('idcard', 'บัตรประชาชน','idcard','idcard'),
   
  ];



  late List<DropdownMenuItem<ListItem>> _dropdownMenuItems;
  late ListItem _selectedItem;


   @override
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropdownMenuItem(_fruits);
    _selectedItem = _dropdownMenuItems[0].value!;
  }




  // radio

   late List<Type> types;
 

    @override
    void initState() {
     super.initState();
     types = Type.getType();
    }






  //





  List<DropdownMenuItem<ListItem>> buildDropdownMenuItem(List<ListItem> fruits) {
    List<DropdownMenuItem<ListItem>> items = [];
    // สร้างดรอปดาวน์
      for (ListItem listItem in fruits) {
      items.add(DropdownMenuItem(
        value: listItem,
        child: Text(listItem.name),

        ));
      }

      return items;
    }

    ///
      List<Widget> createRadioType() {
      List<Widget> mytypes = [];
      for (Type type in types) {
      mytypes.add(
      RadioListTile(
      title: Text(type.engname),
      subtitle: Text(type.nametha),
      controlAffinity: ListTileControlAffinity.platform,
      value: type.typeValue,
      groupValue: groupType,
      onChanged: (value) {
      setState(() {
        groupType = value;
      });
      },
      selected: true,
      ),
      );
      }
      return mytypes;
      }

     ///
      List<Widget> createCheckbox() {
      List<Widget> cardocuments = [];
      for (Cardocument cardocument in cardocuments) {
      cardocuments.add(CheckboxListTile(
      title: Text(cardocument.engname),
      value: cardocument.checked,
      onChanged: (bool value) {
      setState(() {
      cardocument.checked = value;
      }); },
      ));
      }
      return cardocuments;
      }
     ///

    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Class Input Widget"),
      ),
      body: SafeArea(
        child: ListView(
          children:[
              DropdownButton(
                dropdownColor: Colors.blue[200],
              value: _selectedItem,
              items: _dropdownMenuItems,
              onChanged: (value) {
              setState(() {
              _selectedItem = value!;
              });
              },
              )
            
          ],
          
          children :createRadioType(),

          children :createCheckbox(),



          
          

          
           

        )
        
        ),


        
    );
  }
  

  
  
  

}

  class ListItem{
    final String  name;
    final String value;

  ListItem( this.value , this.name);

  

  }

    class Type{
     final String  engname;
     final String  nametha;
     final String value;
   

  Type(this.engname, this.nametha, this.value);
  
 

    }

     class Cardocument{
     final String  engname;
     final String  nametha;
     final String value;
     final Boolean checked;


  Cardocument(this.engname, this.nametha, this.value, this.checked);
  

  
 
    }
    
  