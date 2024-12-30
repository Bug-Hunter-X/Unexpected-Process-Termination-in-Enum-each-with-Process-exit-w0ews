# Elixir Enum.each and Process.exit Bug

This repository demonstrates a subtle bug involving the use of `Process.exit` within an `Enum.each` loop in Elixir.  The issue arises because `Process.exit` terminates the current process immediately, preventing the rest of the `Enum.each` iteration from executing.  This can lead to unexpected behavior and incomplete processing if not carefully considered.

The `bug.exs` file contains the buggy code, while `bugSolution.exs` provides a corrected version.

## Bug Description

The `Enum.each` function iterates over a list.  Inside the loop, a condition checks for the value 3. If found, `Process.exit(self(), :shutdown)` terminates the current process, preventing the loop from continuing and any subsequent code from executing.

## Solution

The solution avoids using `Process.exit` directly within the `Enum.each` loop.  Instead, a more appropriate approach would involve raising an exception, using a different iteration method that allows for early exit but still completes remaining cleanup, or using a different process altogether.