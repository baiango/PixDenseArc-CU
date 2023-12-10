#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include "rgb.cuh"
#include "ycocgp.cuh"

int main() {
	munit_suite_main(&rgb_suite, NULL, NULL, NULL);
	munit_suite_main(&ycocgp_suite, NULL, NULL, NULL);
	return 0;
}
