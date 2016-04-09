from snippet_test import SnippetTest
import unittest


class LuaTest(SnippetTest):
    """LuaTest: tests lua.snippets"""

    def test_upper(self):
        self.assertEqual(1, 3)


if __name__ == "__main__":
    unittest.main()
