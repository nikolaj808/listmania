import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listmania/src/cubits/auth/auth_cubit.dart';
import 'package:listmania/src/cubits/shoppinglists/shoppinglists_cubit.dart';
import 'package:listmania/src/models/create_shoppinglist_input.model.dart';
import 'package:listmania/src/utilities/snackbar_helper.dart';

class CreateShoppinglistScreen extends StatefulWidget {
  CreateShoppinglistScreen({Key? key}) : super(key: key);

  @override
  _CreateShoppinglistScreenState createState() =>
      _CreateShoppinglistScreenState();
}

class _CreateShoppinglistScreenState extends State<CreateShoppinglistScreen> {
  late GlobalKey<FormState> _formKey;

  late TextEditingController _shoppinglistNameController;

  late FocusNode _shoppinglistNameNode;

  @override
  void initState() {
    super.initState();

    _formKey = GlobalKey<FormState>();

    _shoppinglistNameController = TextEditingController();

    _shoppinglistNameNode = FocusNode();
  }

  @override
  void dispose() {
    _shoppinglistNameController.dispose();

    _shoppinglistNameNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ShoppinglistsCubit, ShoppinglistsState>(
      listener: (context, state) {
        switch (state.status) {
          case ShoppinglistsStatus.created:
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackbarHelper.success('Shoppinglist created'));

            Navigator.of(context).pop();
            break;

          case ShoppinglistsStatus.createError:
            ScaffoldMessenger.of(context).showSnackBar(
                SnackbarHelper.error('Error creating shoppinglist'));
            break;

          default:
            break;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black87),
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Create a new shoppinglist',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 32.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32.0,
                      vertical: 16.0,
                    ),
                    child: TextFormField(
                      controller: _shoppinglistNameController,
                      focusNode: _shoppinglistNameNode,
                      decoration: InputDecoration(
                        labelText: 'Shoppinglist name',
                        hintText: 'Enter a name for the shoppinglist',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  SizedBox(height: 32.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      BlocBuilder<ShoppinglistsCubit, ShoppinglistsState>(
                        builder: (context, state) {
                          return ElevatedButton(
                            onPressed: state.status ==
                                    ShoppinglistsStatus.creating
                                ? null
                                : () {
                                    final newShoppinglist =
                                        CreateShoppinglistInput(
                                      name: _shoppinglistNameController.text,
                                      ownerId: (context.read<AuthCubit>().state
                                              as Authenticated)
                                          .user
                                          .uid,
                                      memberIds: [],
                                      createdAt: DateTime.now(),
                                    );

                                    context
                                        .read<ShoppinglistsCubit>()
                                        .createShoppinglist(newShoppinglist);
                                  },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.resolveWith<Color>(
                                (_) => Theme.of(context).accentColor,
                              ),
                            ),
                            child: Text('Create shoppinglist'),
                          );
                        },
                      ),
                      SizedBox(width: 16.0),
                      BlocBuilder<ShoppinglistsCubit, ShoppinglistsState>(
                        builder: (context, state) {
                          if (state.status == ShoppinglistsStatus.creating)
                            return SizedBox(
                              width: 28,
                              height: 28,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            );

                          return Container();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 32.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
