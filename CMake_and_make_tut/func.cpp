#include "func.h"
#include <cmath>

// Force usage of math functions
double calculate_distance(double x1, double y1, double x2, double y2) {
    double dx = x2 - x1;
    double dy = y2 - y1;
    volatile double temp = dx*dx + dy*dy;  // Prevent optimization
    return std::sqrt(temp);
}

double power_calc(double base, double exponent) {
    volatile double b = base;    // Prevent optimization
    volatile double e = exponent;
    return std::pow(b, e);
}