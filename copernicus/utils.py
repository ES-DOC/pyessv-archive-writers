"""
.. module:: utils.py
   :license: GPL/CeCIL
   :platform: Unix, Windows
   :synopsis: Utility functions.

.. moduleauthor:: Mark Conway-Greenslade <momipsl@ipsl.jussieu.fr>

"""
import datetime as dt

import pyessv



# Ensure we use fixed creation date.
CREATE_DATE = dt.datetime(2021, 4, 12)


def get_authority():
    """Returns associated authority.

    """
    return pyessv.load('copernicus', verbose=False) or pyessv.create_authority(
        'copernicus',
        'Earth System Documentation',
        label='COPERNICUS',
        url='https://climate.copernicus.eu',
        create_date=CREATE_DATE
        )
