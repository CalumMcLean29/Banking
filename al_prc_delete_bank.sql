CREATE OR REPLACE PROCEDURE al_prc_delete_bank(p_bank_name VARCHAR2,
                                               p_account_number VARCHAR2,
                                               p_sort_code VARCHAR2)
IS
                                               
BEGIN
    
    --MORE FUNCTIONALITY/SAFE_GUARDING WHEN BALANCES ARE SET UP
    --
    --
    DELETE FROM al_bank
    WHERE bank_name = p_bank_name and
          account_number = p_account_number and
          sort_code = p_sort_code;
    
    
END;
