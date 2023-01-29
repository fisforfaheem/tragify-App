import 'dart:math';

double degToRad(num deg) => deg * (pi);

double normalize(value, min, max) => ((value - min) / (max - min));

double angleRange(value, min, max)=>(value * (max-min) +min);

const double kDiameter = 200;
const double kMinDegree = 5;
const double kMaxDegree = 100;
