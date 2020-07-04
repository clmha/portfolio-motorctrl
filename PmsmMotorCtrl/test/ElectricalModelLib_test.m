function tests = ElectricalModelLib_test()
%ELECTRICALMODELLIB_TEST Test Suite for the Electrical Model Library

tests = functiontests(localfunctions());
end

function testClarkAndParkTransforms(testCase)
%TESTCLARKANDPARKTRANSFORMS
%
% The assessments are actually done in the Simulink test harness itself. We
% just need to simulate it.

sim('ClarkAndParkTransforms_harness');
end