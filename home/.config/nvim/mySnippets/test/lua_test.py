from snippet_test import SnippetTest
import unittest


class TabstopMocked():
    class SnippetPos():
        def __init__(self, start_line):
            self.line = start_line

    def __init__(self, current_text, start_line=10):
        self.current_text = current_text
        self.start = self.SnippetPos(start_line)


class LuaTest(SnippetTest):
    """LuaTest: tests lua.snippets"""
    
    tabstop = TabstopMocked('function1')
    args1 = "arg1, arg2, arg3, arg4, arg5"
    args2 = "arg1, arg2, arg3, arg4, arg5, arg6"
    input1 = "arg1, arg2, arg3, arg4, arg5"
    output1 = '\n'.join(['-- arg1', '-- arg2', '-- arg3', '-- arg4', '-- arg5'])
    input2 = "arg1: int, arg2: bool, arg3: string, arg4: func, arg5: tab, arg6: thread"
    output2 = '\n'.join(['-- int: arg1', '-- bool: arg2', '-- string: arg3'] +
                        ['-- func: arg4', '-- tab: arg5', '-- thread: arg6'])
    input3 = "arg1: {int,...}, arg2: !person, arg3: {[string]=person}," + \
             "arg4: {string,number}, arg5: {A=string,N=number}"
    output3 = '\n'.join(['-- {int,...}: arg1', '-- !person: arg2', '-- {[string]=person}: arg3'] +
                        ['-- {string,number}: arg4', '-- {A=string,N=number}: arg5'])

    input4 = "arg1, arg2: !person, arg3, arg4, arg5: string"
    output4 = '\n'.join(['-- arg1', '-- !person: arg2', '-- arg3'] +
                        ['-- arg4', '-- string: arg5'])
    input5 = "arg1:{int,...},      arg2: !person,       arg3:bool,arg4,arg5    : string"
    output5 = '\n'.join(['-- {int,...}: arg1', '-- !person: arg2', '-- bool: arg3'] +
                        ['-- arg4', '-- string: arg5'])
    # trim spaces in the types
    input6 = "arg1   : {   int    ,   ...}, arg2: !person, arg3: {[string]  = person}," + \
             "    arg4: {   string   ,   number}, arg5: {A=string   , N=number}"
    output6 = '\n'.join(['-- {int,...}: arg1', '-- !person: arg2', '-- {[string]=person}: arg3'] +
                        ['-- {string,number}: arg4', '-- {A=string,N=number}: arg5'])

    def gen_output(self, args):
        return "function {}({})".format(self.tabstop.current_text, args)

    def test_var_deps_no_types(self):
        """test_var with basic arguments, no types"""
        f = self.__dict__['var_deps']
        self.assertEqual(f(self.input1), self.output1)
        self.assertEqual(f(self.input2), self.output2)
        self.assertEqual(f(self.input3), self.output3)
        self.assertEqual(f(self.input4), self.output4)
        self.assertEqual(f(self.input5), self.output5)
        self.assertEqual(f(self.input6), self.output6)

    def test_remove_types(self):
        """test_var with basic arguments, no types"""

        f = self.__dict__['remove_types']
        b1 = [None] * 10
        f(self.tabstop, TabstopMocked(self.input1, 6), b1)
        self.assertEqual(b1[6], self.gen_output(self.args1))

        b1 = [None] * 10
        f(self.tabstop, TabstopMocked(self.input2, 7), b1)
        self.assertEqual(b1[7], self.gen_output(self.args2))

        b1 = [None] * 10
        f(self.tabstop, TabstopMocked(self.input3, 6), b1)
        self.assertEqual(b1[6], self.gen_output(self.args1))

        b1 = [None] * 10
        f(self.tabstop, TabstopMocked(self.input4, 6), b1)
        self.assertEqual(b1[6], self.gen_output(self.args1))

        b1 = [None] * 10
        f(self.tabstop, TabstopMocked(self.input5, 6), b1)
        self.assertEqual(b1[6], self.gen_output(self.args1))

        b1 = [None] * 10
        f(self.tabstop, TabstopMocked(self.input6, 6), b1)
        self.assertEqual(b1[6], self.gen_output(self.args1))

if __name__ == "__main__":
    unittest.main()
