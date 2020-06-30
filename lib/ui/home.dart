import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterappquiz/model/questions.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _index=0;
  Color _mycolor1=Colors.brown;
  Color _mycolor2=Colors.brown;

  List questionBank=[
    Question.name("Good friends should lie to you to make you feel better about yourself rather than telling you the truth...because it's the right thing to do.",false ),
    Question.name("A friend should tell you to see a counsellor if you had a bad day and your friend doesn't feel like hearing about it.",false ),
    Question.name("Good friends can disagree without hurting each other.",true ),
    Question.name("Friends should borrow each others clothes and misplace them and repeatedly lie about the situation.",false ),
    Question.name("A friend should keep everything bottled up inside so that arguments don't arise.",false ),
    Question.name("Good friends give each other room to change.",true ),
    Question.name("You should never be friends with someone who your other friends don't like.",false ),
    Question.name("Friends should be willing to stick up for each other.",true ),
    Question.name("Hanging out with your friends should be a memorable experience and should NOT feel like a task.",true ),
    Question.name("Friends should be selfish and not selfless.",false ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Friendship",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
       // backgroundColor: Colors.deepOrange.shade400,
        centerTitle: true,

      ),
      //backgroundColor: Colors.orange.shade100,
      body: Builder(

        builder: (BuildContext context)=>Container(
          child: Column(
            children: <Widget>[
              Center(child: Image.asset("images/img.jpg",height: 180,width: 250,)),
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.4),
                      border: Border.all(
                          color: Colors.grey,
                          style: BorderStyle.solid
                      )
                  ),

                  alignment: Alignment.center,
                  height: 120,
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(questionBank[_index].question,textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyText1,//style: TextStyle(fontSize: 17.0,color: Colors.brown),
                       ),
                  )),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,

                  children: <Widget>[
                       Container(
                         child: RaisedButton(onPressed: ()=> _prevQuestion(),
                          color: Colors.brown,
                          child: Icon(Icons.arrow_back,color:Colors.orange.shade100,size: 20, ),),
                         width:50,height:36
                       ),


                  RaisedButton(onPressed: ()=> _checkAnswer(true,context),
                      color: _mycolor1,
                      child: Text("True",style: Theme.of(context).textTheme.button,
                        //style: TextStyle(color: Colors.orange.shade100,fontSize: 18,fontWeight: FontWeight.bold),
                      ),

                    ),
                    RaisedButton(onPressed: ()=> _checkAnswer(false,context),
                      color: _mycolor2,
                      child: Text("False",style:Theme.of(context).textTheme.button,
                        //style: TextStyle(color: Colors.orange.shade100,fontSize: 18,fontWeight: FontWeight.bold),
                      ),),
                    Container(
                      width: 50,
                      height: 36,
                      child: RaisedButton(onPressed: ()=> _nextQuestion(),
                        color: Colors.brown,
                        child: Icon(Icons.arrow_forward,color:Colors.orange.shade100,size: 20, ),),
                    ),


                  ],
                ),
              ),
              Spacer()
            ],
          ),
        ),
      ),
    );
  }
  bool _checkAnswer(bool choice,BuildContext context)
  {
    if(choice==questionBank[_index].isCorrect)
    {
      final snackbar=SnackBar(
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
        content: Text("Correct!!!",textAlign: TextAlign.center,));
      Scaffold.of(context).showSnackBar(snackbar);

      //setState(() {
        //_mycolor1=Colors.green;
        //_mycolor2=Colors.brown;
      //});

    }
    else {
      final snackbar=SnackBar(
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
        content:Text("InCorrect!!!",textAlign: TextAlign.center,));
      Scaffold.of(context).showSnackBar(snackbar);

     // setState(() {
        //_mycolor2=Colors.red;
       // _mycolor1=Colors.green;
      //});
    }
    setState(() {
      _index+=1;
    });


  }
  _prevQuestion(){
    setState(() {
      if(_index<=0) {
        _index=9;
      }
      else {
        _index--;
      }
      //_mycolor1=Colors.brown;
      //_mycolor2=Colors.brown;
    });
  }

  _nextQuestion(){
    setState(() {
      if(_index>=9) {
        _index=0;
      }
      else {
        _index++;
      }
   //   _mycolor1=Colors.brown;
    //  _mycolor2=Colors.brown;
    });
  }
}












