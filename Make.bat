@echo off
setlocal disableDelayedExpansion
set "files="
for %%F in (*.pl) do call set files=%%files%% %%~nF%%~xF
swipl --goal=main:startServer --stand_alone=true -o noMansSkyTrainer -c %files%