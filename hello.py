#!/usr/bin/env python3
"""
DevOps Final Assessment Project
Python Application
Author: T SUBHAM PATRO (KRAZATEC)
"""

import sys
import os
from datetime import datetime


def main():
    """
    Main application function
    """
    print("=" * 50)
    print("DevOps Final Assessment Project")
    print("Python Application")
    print("=" * 50)
    print()
    print(f"Hello, DevOps!")
    print(f"Timestamp: {datetime.now()}")
    print(f"Python Version: {sys.version}")
    print(f"Platform: {sys.platform}")
    print(f"Current Directory: {os.getcwd()}")
    print()
    print("=" * 50)
    print("Application Status: SUCCESS")
    print("=" * 50)


if __name__ == "__main__":
    try:
        main()
        sys.exit(0)
    except Exception as e:
        print(f"Error: {e}", file=sys.stderr)
        sys.exit(1)
