"""Unit test file for app.py"""
import unittest

from app.main import HELLO, hello_world


class TestApp(unittest.TestCase):
    """Unit tests defined for main.py"""

    def test_return_backwards_string(self):
        """Test returns hello world string"""
        self.assertEqual(HELLO, hello_world())
