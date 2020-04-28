/*------------------------------------------------------------------------------------------
  PURPOSE    : Autocall macro used to enable or disable debugging levels.
  PARAMETERS :

  level=
    1 - simple debugging on
    2 - advanced debugging on
    0 - debugging off

  log=
    filepath to redirect SAS log (ex: /tmp/test.log)
|-----------------------------------------------------------------------------------------*/

%macro dbug(level=,log=);
  %if %length(&log) gt 0 %then %do;
    %put ==== Redirecting Log to: &log;
    proc printto log="&log" new; run;
  %end;

  %if %length(&level) gt 0 AND &level. eq 1 %then %do;
    %put ==== Enabling Simple Performance Debugging Options;
    options source notes fullstimer msglevel=i;
  %end;

  %if %length(&level) gt 0 AND &level. eq 2 %then %do;
    %put **** Enabling Full Debugging Options with Macro Logic;
    options source source2 notes fullstimer SASTRACE=',,,ds' sastraceloc=saslog nostsuffix mprint mlogic symbolgen spool mprintnest mlogicnest msglevel=i;
    %let syssumtrace=3;
  proc options; run;
  %put ====== ALL Macro Variables Currently Assigned ======;
  %put _ALL_;
  %end;

  %if %length(&level) gt 0 AND &level. eq 0 %then %do;
    %put ==== Disabling Debugging Options;
    options nosource nonotes nomlogic nomprint nosymbolgen nospool sastrace=none;
  %end;
%mend dbug;
