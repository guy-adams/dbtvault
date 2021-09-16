import pytest
from test_project.test_utils.dbt_test_utils import *
from pathlib import Path


def get_test_utils(request):
    # Set working directory to test project root
    os.chdir(TESTS_DBT_ROOT)

    test_path = Path(request.fspath.strpath)
    macro_folder = test_path.parent.name
    macro_under_test = test_path.stem.split('test_')[1]

    return DBTTestUtils(model_directory=f"{macro_folder}/{macro_under_test}")


@pytest.fixture(scope="class")
def dbt_test_utils(request):
    """
    Configure the model_directory in DBTTestUtils using the directory structure of the macro under test.
    """

    request.cls.dbt_test_utils = get_test_utils(request)


@pytest.fixture(scope='class')
def run_seeds(request):
    os.chdir(TESTS_DBT_ROOT)
    request.cls.dbt_test_utils.run_dbt_seed()
    yield


@pytest.fixture(scope='session')
def clean_database(request):
    # Set working directory to test project root
    os.chdir(TESTS_DBT_ROOT)

    test_utils = DBTTestUtils()

    test_utils.drop_test_schemas()


@pytest.fixture(autouse=True, scope='session')
def clean_target():
    """ Clean the target folder for each session"""
    DBTTestUtils.clean_target()
    yield


@pytest.fixture(autouse=True)
def expected_filename(request):
    """
    Provide the current test name to every test, as the filename for the expected output file for that test
    """

    request.cls.current_test_name = request.node.name
