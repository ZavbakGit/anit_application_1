import 'package:anit_application/common/widget/progress_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anit_application/features/programmertask/programmer_task.dart';
import 'package:anit_application/common/util/date_utils.dart';

class ProgrammerTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<ProgrammerTaskBloc, ProgrammerTaskState>(
        listener: (context, state) {
          if (state is LoadFailState) {
            if ((state.message ?? "").isNotEmpty) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                ),
              );
            }
          }
        },
        child: Container(
          child: SingleChildScrollView(
            child: TaskScreen(),
          ),
        ),
      ),
    );
  }
}

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProgrammerTaskBloc, ProgrammerTaskState>(
      builder: (context, state) {
        if (state is InitialState) {
          BlocProvider.of<ProgrammerTaskBloc>(context).add(LoadTaskEvent());
          return Text('');
        }

        if (state is LoadInProgressState) {
          return ProgressWidget();
        }

        if (state is LoadFailState) {
          return Text('Error: ${state.message}');
        }

        if (state is LoadSuccessState) {
          return Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FieldInformation(
                    title: 'Номер',
                    text: '${state.task.number}',
                  ),
                  FieldInformation(
                    title: 'Дата',
                    text: '${state.task.date.getDateFormatDDMMYY() ?? ""}',
                  ),
                  FieldInformation(
                    title: 'Приоритет',
                    text: '${state.task.priority}',
                  ),
                ],
              ),
              FieldInformation(
                title: 'Статус',
                text: '${state.task.status ?? ""}',
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  FieldInformation(
                    title: 'Клиент',
                    text: '${state.task.partner ?? ""}',
                  ),
                  SizedBox(width: 10.0,),
                  FieldInformation(
                    title: 'Контактное лицо',
                    text: '${state.task.contact ?? ""}',
                  ),
                ],
              ),
              FieldInformation(
                title: 'Контрагент',
                text: '${state.task.contact ?? ""}',
              ),
              Row(
                children: <Widget>[
                  FieldInformation(
                    title: 'Дата начала',
                    text: '${state.task.dateStart.getDateFormatDDMMYY() ?? ""}',
                  ),
                  FieldInformation(
                    title: 'Срок ',
                    text: '${state.task.planeDateFinish.getDateFormatDDMMYY() ?? ""}',
                  ),
                ],
              ),
              FieldInformation(
                title: 'Постановщик',
                text: '${state.task.director ?? ""}',
              ),
              FieldInformation(
                title: 'Контролер',
                text: '${state.task.inspector ?? ""}',
              ),

              FieldInformation(
                title: 'Описание',
                text: '${state.task.task ?? ""}',
              ),
              FieldInformation(
                title: 'Техническое задание',
                text: '${state.task.technicalTask ?? ""}',
              ),
              FieldInformation(
                title: 'Комментарий',
                text: '${state.task.comment ?? ""}',
              ),
            ],
          );
        }

        return Text('Unknown state');
      },
    );
  }
}

class FieldInformation extends StatelessWidget {
  final String title;
  final String text;

  const FieldInformation({Key key, this.title, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
      child: Column(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
//          Container(
//            child: Text(
//              title,
//              style: TextStyle(color: Colors.blue),
//            ),
//          ),
//          Divider(),
          TextField(
            
          ),
        ],
      ),
    );
  }
}

class FieldInformation1 extends StatelessWidget {
  final String title;
  final String text;

  const FieldInformation1({Key key, this.title, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0, left: 10.0),
      child: Column(
        textDirection: TextDirection.ltr,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Container(
            child: Text(
              title,
              style: TextStyle(color: Colors.blue),
            ),
          ),
          Divider(),
          Text(text),
        ],
      ),
    );
  }
}
