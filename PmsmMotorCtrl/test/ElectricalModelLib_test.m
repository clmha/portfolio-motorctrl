function tests = ElectricalModelLib_test()
%ELECTRICALMODELLIB_TEST Test Suite for the Electrical Model Library

tests = functiontests(localfunctions());
end

function testClarkTransforms(testCase)
%TESTCLARKTRANSFORMS
%
% Verifications is actually done in the Simulink test harness itself. We
% just need to simulate it.
sim('ClarkTransforms_harness');
end