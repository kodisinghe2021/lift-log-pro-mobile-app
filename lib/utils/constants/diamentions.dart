import 'package:flutter/material.dart';

double w(BuildContext context) => MediaQuery.of(context).size.width;
double h(BuildContext context) => MediaQuery.of(context).size.height;

double paddingHorizontal(BuildContext context) => w(context) * .05;
double paddingVertical(BuildContext context) => h(context) * .01;
