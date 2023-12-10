#include "rgb.cuh"

__host__ __device__
u1 pda_are_equal_rgb888(RGB888 a, RGB888 b) {
	return (a.r == b.r) &&
		(a.g == b.g) &&
		(a.b == b.b);
}

/* ----- µnit ----- */
MunitTest rgb_tests[] = {
	{"Are equal RGB888", pda_test_are_equal_rgb888, NULL, NULL, MUNIT_TEST_OPTION_NONE, NULL},
	{NULL, NULL, NULL, NULL, MUNIT_TEST_OPTION_NONE, NULL },
};

MunitSuite rgb_suite = {
	"/RGB/", /* name */
	rgb_tests, /* tests */
	NULL, /* suites */
	1, /* iterations */
	MUNIT_SUITE_OPTION_NONE /* options */
};

MunitResult pda_test_are_equal_rgb888(const MunitParameter params[], void* user_data) {
	return pda_are_equal_rgb888({200, 200, 200}, {200, 200, 200}) ? MUNIT_OK : MUNIT_FAIL;
}
