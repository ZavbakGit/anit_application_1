import 'package:anit_application/common/widget/progress_widget.dart';
import 'package:anit_application/features/listprogrammertask/bloc/list_task_programmer_bloc.dart';
import 'package:anit_application/features/listprogrammertask/bloc/list_tasks_programmer_event.dart';
import 'package:anit_application/features/listprogrammertask/bloc/list_tasks_programmer_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:anit_application/common/util/date_utils.dart';

class ListTaskPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final appModel = Provider.of<AppModel>(context);

    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: (){

            },
          )
        ],
      ),
      body: SafeArea(
        child: Center(
          child:
              BlocListener<ListTasksProgrammerBloc, ListTasksProgrammerState>(
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
              child: TasksScreen(),
            ),
          ),
        ),
      ),
    );
  }
}

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListTasksProgrammerBloc, ListTasksProgrammerState>(
      builder: (context, state) {
        if (state is InitialState) {
          BlocProvider.of<ListTasksProgrammerBloc>(context)
              .add(LoadTasksEvent());
          return Text('');
        }

        if (state is LoadInProgressState) {
          return ProgressWidget();
        }

        if (state is LoadFailState) {
          return Text('Error: ${state.message}');
        }

        if (state is LoadSuccessState) {
          return RefreshIndicator(
            onRefresh: () {
              BlocProvider.of<ListTasksProgrammerBloc>(context)
                  .add(LoadTasksEvent());
              return;
            },
            child: ListView.separated(
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Divider(
                  color: Colors.black,
                ),
              ),
              itemCount: state.tasks.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/programmer_task',
                      arguments: state.tasks[index].guid);
                },
                child: Container(
                  color: index % 2 != 0 ? Colors.white : Colors.yellow[50],
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Column(
                          children: <Widget>[
                            Text(
                              '${state.tasks[index].dateStart.getDaysPassedString()}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        title: Text('${state.tasks[index].task}'),
                        subtitle: Column(
                          //mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Divider(),
                            Text('${state.tasks[index].status}'),
                            Text('${state.tasks[index].director}'),
                            Text(
                              '${state.tasks[index].partner}',
                              style: TextStyle(color: Colors.indigo),
                            ),
                          ],
                        ),
                      ),
                      //Divider(),
                    ],
                  ),
                ),
              ),
            ),
          );
        }

        return Text('Unknown state');
      },
    );
  }
}

String _formatDateTime(DateTime dateTime) {
  return DateFormat("dd.MM.yy").format(dateTime);
}


