create or replace NONEDITIONABLE PROCEDURE al_prc_upsert_bank(p_bank_name VARCHAR2,
                                               p_account_number VARCHAR2,
                                               p_sort_code VARCHAR2,
                                               p_account_moniker VARCHAR2,
                                               p_account_type VARCHAR2)
IS

BEGIN

    MERGE INTO al_bank b
        USING dual on (b.account_number = p_account_number and
                       b.sort_code = p_sort_code and
                       b.bank_name = p_bank_name)
        WHEN NOT MATCHED THEN 
            INSERT 
            (bank_name, account_number,sort_code, account_moniker, account_type, bank_id)
            VALUES
            (p_bank_name, p_account_number, p_sort_code, p_account_moniker, p_account_type, al_seq_bank_id.nextval)
        WHEN MATCHED THEN
            UPDATE SET account_moniker = p_account_moniker
            WHERE account_moniker != p_account_moniker;

END;
