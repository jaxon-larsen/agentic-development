# Logic Prototype

Use an interactive terminal harness when the user needs to try actions and inspect changing state. A single-run script is enough when one input/output example answers the question.

1. State the design question and the observation that would settle it in a comment or the handoff.
2. Use the project's existing language and runtime. Keep state in memory unless persistence is what the experiment tests.
3. Separate the logic from the terminal shell when doing so makes the behavior easier to inspect or may allow safe reuse. A reducer, state machine, or small function set is often enough.
4. Show the initial state and the result of each action. Use a simple line prompt or key loop only when the user needs to drive multiple transitions; avoid terminal styling and libraries unless they help the experiment.
5. Give the user a command they can run. Record what the experiment established and remove the harness when its question is answered.

The validated logic may inform production code. If code is reused, first bring it up to normal production standards for types, errors, and verification.
