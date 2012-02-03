Sequel.migration do
  change do
    create_table :meetings do
      # Meta info for database
      primary_key :id
      DateTime :create_date
      DateTime :modify_date
      # Meta info about the meeting.
      String :meeting_name
      DateTime :meeting_date
      String :ldap_cc
      String :ldap_attendies
      # Meeting itself
      String :problem
      String :solution
    end
    create_table :action_items do
      # Meta info for database
      primary_key :id
      DateTime :create_date
      DateTime :modify_date
      # Action item info
      String :ldap
      String :action
      Boolean :complete, :default => 0
    end
  end
end
