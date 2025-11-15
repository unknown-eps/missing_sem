#include <iostream>
#include "func.h"

int main() {
    double dist = calculate_distance(0.0, 0.0, 3.1230, 4.12321);
    std::cout << "Distance: " << dist << std::endl;  // Should print 5

    double result = power_calc(2.0, 3.0);
    std::cout << "2^3 = " << result << std::endl;    // Should print 8

    return 0;
}