" Operating System : Processes
syntax keyword racketFunc subprocess subprocess-wait subprocess-status subprocess-kill subprocess-pid subprocess?
syntax keyword racketSyntax current-subprocess-custodian-mode subprocess-group-enabled current-subprocess-keep-file-descriptors

syntax keyword racketFunc system system* system/exit-code	system*/exit-code
syntax keyword racketFunc process process* process/ports process*/ports
syntax keyword racketFunc string-no-nuls? bytes-no-nuls?


" Operating System : Filesystem
syntax keyword racketFunc find-system-path find-executable-path


" Input and Output : Ports : Encoding and Locales
syntax keyword racketFunc current-locale


" Input and Output : Ports : Managing Ports
syntax keyword racketFunc port? input-port? output-port?
syntax keyword racketFunc close-input-port close-output-port port-closed? port-closed-evt
syntax keyword racketFunc file-stream-port? terminal-port? port-waiting-peer?

syntax keyword racketFunc current-input-port current-output-port current-error-port

syntax keyword racketExtSyntax eof


" Input and Output : Ports : Ports Buffer and Positions
syntax keyword racketFunc flush-output file-stream-buffer-mode file-position file-position* file-truncate


" Input and Output : Ports : String Ports
syntax keyword racketFunc string-port?
syntax keyword racketFunc open-input-bytes open-input-string open-output-bytes open-output-string
syntax keyword racketFunc get-output-bytes get-output-string


" Input and Output : Ports : String Ports
syntax keyword racketFunc port->list port->string port->bytes port->lines	port->bytes-lines	display-lines
syntax keyword racketFunc call-with-output-string call-with-output-bytes with-output-to-string with-output-to-bytes
syntax keyword racketFunc call-with-input-string call-with-input-bytes with-input-from-string with-input-from-bytes


" Datatype : strings
syntax keyword racketFunc non-empty-string?
syntax keyword racketFunc string-contains?


" Contracts
syntax keyword racketFunc contract? chaperone-contract? impersonator-contract? flat-contract? list-contract?
syntax keyword racketFunc contract-name value-contract has-contract? value-blame has-blame?
syntax keyword racketFunc parametric->/c

syntax keyword racketSyntax contract-out


" Modules
syntax keyword racketSyntax all-defined-out all-from-out
syntax keyword racketSyntax rename-out except-out prefix-out struct-out combine-out
syntax keyword racketSyntax for-meta for-syntax for-template for-label for-space

syntax keyword racketSyntax only-in except-in prefix-in rename-in combine-in relative-in
syntax keyword racketSyntax only-meta-in only-space-in
syntax keyword racketSyntax for-syntax for-template for-label for-meta or-space


" Concurrency and Parallelism : Threads
syntax keyword racketFunc sleep

" Concurrency and Parallelism : Futures
syntax keyword racketFunc future touch

" SRFI 54
syntax keyword racketFunc cat


" Zuo
syntax keyword racketFunc alert ~v ~a ~s string-read
syntax keyword racketFunc variable variable? variable-set! opaque opaque-ref
syntax keyword racketFunc module-paths? build-module-path module->hash dynamic-require kernel-eval kernel-env
syntax keyword racketFunc handle? fd-open-input fd-open-output fd-close fd-read fd-write fd-terminal? fd-valid? file->string
syntax keyword racketFunc cleanable-file cleanable-cancel
syntax keyword racketFunc shell shell/wait build-shell shell-subst
syntax keyword racketFunc runtime-env system-type current-time dump-image-and-exit exit suspend-signal resume-signal
syntax keyword racketFunc file-exists? directory-exists?A link-exists?

