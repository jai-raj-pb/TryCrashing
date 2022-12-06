# TryCrashing
Tried reproducing a crash similar to this: https://console.firebase.google.com/u/0/project/mindtickle-ce5f8/crashlytics/app/ios:com.mindtickle/issues/45e27e868b1d3e842d2534c86d4f88d5?time=last-seven-days&sessionEventKey=dfce5efd5fd043b7bd0c977954adfe40_1752469140874212067

Check ViewController.swift and Atomic.swift

concurrent reads with mutation without barrier was causing the crash.

Running the project as it is will crash the app at some concurrent <code>Set.contains(_:)</code> operation, <code>.barrier</code> flag while mutating fixes the problem.
