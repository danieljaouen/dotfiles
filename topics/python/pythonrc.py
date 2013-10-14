#!/usr/bin/env python

from __future__ import division, print_function, unicode_literals

import atexit
import inspect
import os
import readline
import rlcompleter

from pprint import pprint
from see import see


def get_true_argspec(method):
    argspec = inspect.argspec(method)
    args = argspec[0]
    if args and args[0] == 'self':
        return argspec
    if hasattr(method, '__func__'):
        method = method.__func__
    if not hasattr(method, 'func_closure') or method.func_closure is None:
        raise Exception('No closure for this method.')

    method = method.func_closure[0].cell_contents
    return get_true_argspec(method)


def src(obj):
    """Read the source of an object in the interpreter."""

    def highlight(source):
        try:
            import pygments
            import pygments.formatters
            import pygments.lexers
        except ImportError:
            return source
        lexer = pygments.lexers.get_lexer_by_name('python')
        formatter = pygments.formatters.terminal.TerminalFormatter()
        return pygments.highlight(source, lexer, formatter)

    import subprocess

    source = inspect.getsource(obj)
    pager = subprocess.Popen(['less', '-R'], stdin=subprocess.PIPE)
    pager.communicate(highlight(source))
    pager.wait()


readline.parse_and_bind('tab: complete')
history = os.path.expanduser("~/.pythonhist")


def save_history(history=history):
    import readline
    readline.write_history_file(history)

if os.path.exists(history):
    try:
        readline.read_history_file(history)
    except IOError:
        pass

atexit.register(save_history)
del os, atexit, readline, rlcompleter, save_history, history
