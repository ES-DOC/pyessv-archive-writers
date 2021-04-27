# -*- coding: utf-8 -*-
"""
.. module:: write_vocabs.py
   :license: GPL/CeCIL
   :platform: Unix
   :synopsis: Writes ES-DOC errata vocabularies to file system.

.. moduleauthor:: Mark Conway-Greenslade <momipsl@ipsl.jussieu.fr>


"""
import pyessv
import utils


# Set of regional domains.
_DOMAIN = {
    "EUR-11",
}


# Map: institution <-> rcm models.
_MAP_INSTITUTE_TO_RCM_MODEL = {
	"CNRM": { "CNRM-ALADIN63", },
	"DMI": { "DMI-HIRHAM5", },
	"ETH": { "COSMO-CRCLIM", },
    "GERICS": { "GERICS-REMO2015", },
    "ICTP": { "ICTP-RegCM4-6", },
    "IPSL": { "IPSL-WRF381P", },
    "KNMI": { "KNMI-RACMO22E", },
    "MOHC": { "MOHC-HadREM3-GA7-05", },
    "MPI-CSC": { "MPI-CSC-REMO2009", },
    "SMHI": { "SMHI-RCA4", },
    "UHOH": { "UHOH-WRF361H", },
}


def _write():
    """Writes CORDEXP ES-DOC vocabularies to pyessv-archive.

    """
    pyessv.archive(_get_authority())


def _get_authority():
    """Writes ES-DOC authority.

    """
    authority = utils.get_authority()
    scope = _get_scope(authority)

    return authority


def _get_scope(authority):
    """Writes ES-DOC cmip6 scope.

    """
    scope = \
        pyessv.load('copernicus:cordexp', verbose=False) or \
        pyessv.create_scope(authority,
            'cordexp',
            'Copernicus controlled Vocabularies (CVs) for use in cordex-principles',
            create_date=utils.CREATE_DATE,
            label='CORDEX',
            url='https://climate.copernicus.eu/sites/default/files/2021-03/C3Swebinar2_Katharina_Buelow.pdf'
        )

    for factory in (
        _get_collection_domain,
        _get_collection_insititution,
        _get_collection_rcm_model,
        ):
        factory(scope)

    return scope


def _get_collection_domain(scope):
    """Writes colleciton of associated institutions.

    """
    collection = pyessv.create_collection(scope, 'DOMAIN',
        create_date=utils.CREATE_DATE,
        label='Regional domains',
        description="Regional domain constraining modelling context."
    )

    for domain in _DOMAIN:
        pyessv.create_term(collection, domain.lower(),
            create_date=utils.CREATE_DATE,
            label=domain,
        )

    return collection


def _get_collection_insititution(scope):
    """Writes colleciton of associated institutions.

    """
    collection = pyessv.create_collection(scope, 'INSTITUTION_ID',
        create_date=utils.CREATE_DATE,
        label='Institutes',
        description="Participating climate modelling institutions"
    )

    for institution in _MAP_INSTITUTE_TO_RCM_MODEL.keys():
        pyessv.create_term(collection, institution.lower(),
            create_date=utils.CREATE_DATE,
            label=institution,
        )

    return collection


def _get_collection_rcm_model(scope):
    """Writes colleciton of associated rcm models.

    """
    collection = pyessv.create_collection(scope, 'RCM_MODEL',
        create_date=utils.CREATE_DATE,
        label='RCM Model',
        description="Regional Coupled Model"
    )
    collection.raw_name = "RCM_MODEL"

    for institution, models in _MAP_INSTITUTE_TO_RCM_MODEL.items():
        for model in models:
            pyessv.create_term(collection, model.lower(),
                create_date=utils.CREATE_DATE,
                label=model,
                data={
                    "institution": institution.lower()
                }
            )

    return collection


# Entry point.
if __name__ == '__main__':
    _write()
