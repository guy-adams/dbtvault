import pytest
from unittest import TestCase


@pytest.mark.usefixtures('dbt_test_utils', 'clean_database')
class TestHashColumnsMacro(TestCase):
    maxDiff = None

    def test_hash_columns_correctly_generates_hashed_columns_for_single_columns(self):
        process_logs = self.dbt_test_utils.run_dbt_model(model_name=self.current_test_name)
        actual_sql = self.dbt_test_utils.retrieve_compiled_model(self.current_test_name)
        expected_sql = self.dbt_test_utils.retrieve_expected_sql(self.current_test_name)

        assert 'Done' in process_logs
        assert 'SQL compilation error' not in process_logs
        self.assertEqual(expected_sql, actual_sql)

    def test_hash_columns_correctly_generates_hashed_columns_for_composite_columns_hashdiff(self):

        process_logs = self.dbt_test_utils.run_dbt_model(model_name=self.current_test_name)
        actual_sql = self.dbt_test_utils.retrieve_compiled_model(self.current_test_name)
        expected_sql = self.dbt_test_utils.retrieve_expected_sql(self.current_test_name)

        assert 'Done' in process_logs
        assert 'SQL compilation error' not in process_logs
        self.assertEqual(expected_sql, actual_sql)

    def test_hash_columns_correctly_generates_hashed_columns_for_composite_columns_non_hashdiff(self):

        process_logs = self.dbt_test_utils.run_dbt_model(model_name=self.current_test_name)
        actual_sql = self.dbt_test_utils.retrieve_compiled_model(self.current_test_name)
        expected_sql = self.dbt_test_utils.retrieve_expected_sql(self.current_test_name)

        assert 'Done' in process_logs
        assert 'SQL compilation error' not in process_logs
        self.assertEqual(expected_sql, actual_sql)

    def test_hash_columns_correctly_generates_hashed_columns_for_multiple_composite_columns_hashdiff(self):

        process_logs = self.dbt_test_utils.run_dbt_model(model_name=self.current_test_name)
        actual_sql = self.dbt_test_utils.retrieve_compiled_model(self.current_test_name)
        expected_sql = self.dbt_test_utils.retrieve_expected_sql(self.current_test_name)

        assert 'Done' in process_logs
        assert 'SQL compilation error' not in process_logs
        self.assertEqual(expected_sql, actual_sql)

    def test_hash_columns_correctly_generates_unsorted_hashed_columns_for_composite_columns_mapping(self):

        process_logs = self.dbt_test_utils.run_dbt_model(model_name=self.current_test_name)
        actual_sql = self.dbt_test_utils.retrieve_compiled_model(self.current_test_name)
        expected_sql = self.dbt_test_utils.retrieve_expected_sql(self.current_test_name)

        assert 'Done' in process_logs
        assert 'SQL compilation error' not in process_logs
        self.assertEqual(expected_sql, actual_sql)

    def test_hash_columns_correctly_generates_sql_from_yaml(self):
        process_logs = self.dbt_test_utils.run_dbt_model(model_name=self.current_test_name)
        expected_sql = self.dbt_test_utils.retrieve_expected_sql(self.current_test_name)
        actual_sql = self.dbt_test_utils.retrieve_compiled_model(self.current_test_name)

        assert 'Done' in process_logs
        assert 'SQL compilation error' not in process_logs
        self.assertEqual(expected_sql, actual_sql)

    def test_hash_columns_correctly_generates_sql_with_constants_from_yaml(self):
        process_logs = self.dbt_test_utils.run_dbt_model(model_name=self.current_test_name)
        expected_sql = self.dbt_test_utils.retrieve_expected_sql(self.current_test_name)
        actual_sql = self.dbt_test_utils.retrieve_compiled_model(self.current_test_name)

        assert 'Done' in process_logs
        assert 'SQL compilation error' not in process_logs
        self.assertEqual(expected_sql, actual_sql)

    def test_hash_columns_raises_warning_if_mapping_without_hashdiff(self):
        process_logs = self.dbt_test_utils.run_dbt_model(model_name=self.current_test_name)
        expected_sql = self.dbt_test_utils.retrieve_expected_sql(self.current_test_name)
        actual_sql = self.dbt_test_utils.retrieve_compiled_model(self.current_test_name)
        warning_message = "You provided a list of columns under a 'columns' key, " \
                          "but did not provide the 'is_hashdiff' flag. Use list syntax for PKs."

        assert warning_message in process_logs
        self.assertEqual(expected_sql, actual_sql)
