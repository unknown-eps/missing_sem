#!/bin/bash
#!/bin/bash
echo "=== Main Shell ==="
echo "PID via \$\$      : $$"
echo "PID via \$BASHPID : $BASHPID"
echo

(
    echo "=== First-level Subshell ==="
    echo "PID via \$\$      : $$"
    echo "PID via \$BASHPID : $BASHPID"

    (
        echo "=== Second-level Subshell ==="
        echo "PID via \$\$      : $$"
        echo "PID via \$BASHPID : $BASHPID"
    )
)