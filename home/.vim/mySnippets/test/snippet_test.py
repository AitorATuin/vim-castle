#!/usr/bin/python3
"""Tests MySnippets
"""

import unittest


class SnippetTest(unittest.TestCase):
    """Abstract class for snippet tests"""
    def setUp(self):
        language = self.__class__.__name__.replace('Test', '').lower()
        self.filename = '{}.snippets'.format(language)
        self.__test_ns = self.__load_file_to_test(self.filename)
        self.__dict__.update(self.__test_ns)

    def __load_file_to_test(self, snippets_file):
        """Parses a snippet file and loads the python code in it.

        :snippets_file: TODO
        :returns: TODO

        """
        lines = []
        with open(snippets_file) as f:
            lines = f.readlines()

        i = next(i for i, line in enumerate(lines) if line.startswith('global !p'))
        j = next(i for i, line in enumerate(lines[i:]) if line.startswith('endglobal'))

        python_code = "\n".join(lines[i + 1:i + j])
        python_bcode = compile(python_code, snippets_file, 'exec')
        ns = {}
        exec(python_bcode, ns)

        return ns
