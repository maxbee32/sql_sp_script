DECLARE @TYPED_XML XML(dbo.FIC_SCHEMA);
DECLARE @UNTYPED_XML XML = N'
<report>
  <schema_version>5.1</schema_version>
  <rentity_id>2</rentity_id>
  <rentity_branch>Kumasi Retail Branch</rentity_branch>
  <submission_code>E</submission_code>
  <report_code>CTR</report_code>
  <submission_date>2023-04-11T00:00:00</submission_date>
  <currency_code_local>GHC</currency_code_local>
  <reporting_user_code>Edith</reporting_user_code>
  <location>
    <address_type>-</address_type>
    <address>-</address>
    <additional_address_line1>-</additional_address_line1>
    <additional_address_line2>-</additional_address_line2>
    <city>ASHANTI</city>
    <zip />
    <country_code>GH</country_code>
  </location>
  <transaction>
    <transactionnumber>20020908406</transactionnumber>
    <transaction_is_suspicious>false</transaction_is_suspicious>
    <agent_name>ISAAC ACQUAH</agent_name>
    <transaction_location />
    <transaction_description>cash deposit by Beatrice Yeboah Tiwaa</transaction_description>
    <date_transaction>2023-04-11T00:00:00</date_transaction>
    <teller>Benjamin Duut</teller>
    <authorized>Benjamin Duut</authorized>
    <transaction_type_code>2023-04-11T00:00:00</transaction_type_code>
    <transmode_code>A</transmode_code>
    <transmode_comment>-</transmode_comment>
    <amount_local>30100.0000</amount_local>
    <transaction_status>C</transaction_status>
    <involved_parties>
      <party>
        <role>-</role>
        <entity_my_client>
          <name>-</name>
          <commercial_name>-</commercial_name>
          <incorporation_legal_form>-</incorporation_legal_form>
          <incorporation_number>-</incorporation_number>
          <business>-</business>
          <entity_status>---</entity_status>
          <entity_status_date>1900-01-01T00:00:00</entity_status_date>
          <phones>
            <phone>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </phone>
          </phones>
          <addresses>
            <address>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>---</city>
              <zip />
              <country_code>GH</country_code>
            </address>
          </addresses>
          <network_devices>
            <network_device>
              <device_number />
              <ip_address>
                <ipv4>172.18.18.81</ipv4>
              </ip_address>
            </network_device>
          </network_devices>
          <email />
          <url />
          <incorporation_state />
          <incorporation_country_code>-</incorporation_country_code>
          <director_id>
            <gender>-</gender>
            <title />
            <first_name>-</first_name>
            <middle_name>-</middle_name>
            <prefix>-</prefix>
            <last_name>-</last_name>
            <birthdate>1900-01-01T00:00:00</birthdate>
            <birth_place />
            <country_of_birth>-</country_of_birth>
            <mothers_name />
            <alias />
            <full_name_frn>-</full_name_frn>
            <previous_names>
              <previous_name>
                <first_name>-</first_name>
                <last_name>-</last_name>
              </previous_name>
            </previous_names>
            <ssn />
            <passport_number>-</passport_number>
            <passport_country>-</passport_country>
            <id_number />
            <nationality1>-</nationality1>
            <nationality2>-</nationality2>
            <nationality3>-</nationality3>
            <residence>-</residence>
            <residence_since>1900-01-01T00:00:00</residence_since>
            <phones />
            <addresses />
            <network_devices>
              <network_device>
                <device_number />
                <ip_address>
                  <ipv4>172.18.18.81</ipv4>
                </ip_address>
              </network_device>
            </network_devices>
            <email>-----</email>
            <social_media>
              <social_account>
                <platform />
                <user_name />
              </social_account>
            </social_media>
            <occupation>-</occupation>
            <employer_name>-</employer_name>
            <employer_address_id>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>-</city>
              <zip />
              <country_code>GH</country_code>
            </employer_address_id>
            <employer_phone_id>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </employer_phone_id>
            <identifications>
              <identification>
                <type>-</type>
                <number />
                <issued_by />
                <issue_country>-</issue_country>
              </identification>
            </identifications>
            <deceased />
            <date_deceased>1900-01-01T00:00:00</date_deceased>
            <tax_number>-</tax_number>
            <tax_reg_number>-</tax_reg_number>
            <source_of_wealth />
            <peps>
              <pep>
                <pep_country>-</pep_country>
              </pep>
            </peps>
            <is_protected>true</is_protected>
            <sanctions>
              <sanction_list>
                <provider />
                <sanction_list_name />
              </sanction_list>
            </sanctions>
            <related_persons>
              <person_related_person>
                <person_person_relation>-</person_person_relation>
                <person>
                  <gender>-</gender>
                  <title />
                  <first_name>-</first_name>
                  <middle_name>-</middle_name>
                  <prefix>-</prefix>
                  <last_name>-</last_name>
                </person>
              </person_related_person>
            </related_persons>
            <re_relationship>
              <relationship_date_range>
                <valid_from>1900-01-01T00:00:00</valid_from>
              </relationship_date_range>
            </re_relationship>
            <additional_information>
              <additional_info>
                <info_subject>-</info_subject>
              </additional_info>
            </additional_information>
            <comments />
            <role>-</role>
          </director_id>
          <related_entities>
            <entity_related_entity>
              <entity_entity_relation />
              <entity>
                <name>-</name>
              </entity>
            </entity_related_entity>
          </related_entities>
          <incorporation_date>1900-01-01T00:00:00</incorporation_date>
        </entity_my_client>
        <foreign_currency>
          <foreign_currency_code>-</foreign_currency_code>
          <foreign_amount>0</foreign_amount>
          <foreign_exchange_rate>0</foreign_exchange_rate>
        </foreign_currency>
        <country>-</country>
      </party>
    </involved_parties>
  </transaction>
  <report_indicators>
    <indicator>-</indicator>
  </report_indicators>
  <additional_information>
    <additional_info>
      <info_subject>-</info_subject>
    </additional_info>
  </additional_information>
</report>
<report>
  <schema_version>5.1</schema_version>
  <rentity_id>3</rentity_id>
  <rentity_branch>Sunyani Branch</rentity_branch>
  <submission_code>E</submission_code>
  <report_code>CTR</report_code>
  <submission_date>2023-04-11T00:00:00</submission_date>
  <currency_code_local>GHC</currency_code_local>
  <reporting_user_code>Edith</reporting_user_code>
  <location>
    <address_type>-</address_type>
    <address>-</address>
    <additional_address_line1>-</additional_address_line1>
    <additional_address_line2>-</additional_address_line2>
    <city>BS-0012-3933</city>
    <zip />
    <country_code>GH</country_code>
  </location>
  <transaction>
    <transactionnumber>20020906610</transactionnumber>
    <transaction_is_suspicious>false</transaction_is_suspicious>
    <agent_name>Gloria Gyamfi</agent_name>
    <transaction_location />
    <transaction_description>CASH DEP BY KWABENA ASIEDU</transaction_description>
    <date_transaction>2023-04-11T00:00:00</date_transaction>
    <teller>Faustina Aayire</teller>
    <authorized>Faustina Aayire</authorized>
    <transaction_type_code>2023-04-11T00:00:00</transaction_type_code>
    <transmode_code>A</transmode_code>
    <transmode_comment>-</transmode_comment>
    <amount_local>20070.0000</amount_local>
    <transaction_status>C</transaction_status>
    <involved_parties>
      <party>
        <role>-</role>
        <entity_my_client>
          <name>-</name>
          <commercial_name>-</commercial_name>
          <incorporation_legal_form>-</incorporation_legal_form>
          <incorporation_number>-</incorporation_number>
          <business>-</business>
          <entity_status>---</entity_status>
          <entity_status_date>1900-01-01T00:00:00</entity_status_date>
          <phones>
            <phone>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </phone>
          </phones>
          <addresses>
            <address>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>---</city>
              <zip />
              <country_code>GH</country_code>
            </address>
          </addresses>
          <network_devices>
            <network_device>
              <device_number />
              <ip_address>
                <ipv4>172.18.18.81</ipv4>
              </ip_address>
            </network_device>
          </network_devices>
          <email />
          <url />
          <incorporation_state />
          <incorporation_country_code>-</incorporation_country_code>
          <director_id>
            <gender>-</gender>
            <title />
            <first_name>-</first_name>
            <middle_name>-</middle_name>
            <prefix>-</prefix>
            <last_name>-</last_name>
            <birthdate>1900-01-01T00:00:00</birthdate>
            <birth_place />
            <country_of_birth>-</country_of_birth>
            <mothers_name />
            <alias />
            <full_name_frn>-</full_name_frn>
            <previous_names>
              <previous_name>
                <first_name>-</first_name>
                <last_name>-</last_name>
              </previous_name>
            </previous_names>
            <ssn />
            <passport_number>-</passport_number>
            <passport_country>-</passport_country>
            <id_number />
            <nationality1>-</nationality1>
            <nationality2>-</nationality2>
            <nationality3>-</nationality3>
            <residence>-</residence>
            <residence_since>1900-01-01T00:00:00</residence_since>
            <phones />
            <addresses />
            <network_devices>
              <network_device>
                <device_number />
                <ip_address>
                  <ipv4>172.18.18.81</ipv4>
                </ip_address>
              </network_device>
            </network_devices>
            <email>-----</email>
            <social_media>
              <social_account>
                <platform />
                <user_name />
              </social_account>
            </social_media>
            <occupation>-</occupation>
            <employer_name>-</employer_name>
            <employer_address_id>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>-</city>
              <zip />
              <country_code>GH</country_code>
            </employer_address_id>
            <employer_phone_id>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </employer_phone_id>
            <identifications>
              <identification>
                <type>-</type>
                <number />
                <issued_by />
                <issue_country>-</issue_country>
              </identification>
            </identifications>
            <deceased />
            <date_deceased>1900-01-01T00:00:00</date_deceased>
            <tax_number>-</tax_number>
            <tax_reg_number>-</tax_reg_number>
            <source_of_wealth />
            <peps>
              <pep>
                <pep_country>-</pep_country>
              </pep>
            </peps>
            <is_protected>true</is_protected>
            <sanctions>
              <sanction_list>
                <provider />
                <sanction_list_name />
              </sanction_list>
            </sanctions>
            <related_persons>
              <person_related_person>
                <person_person_relation>-</person_person_relation>
                <person>
                  <gender>-</gender>
                  <title />
                  <first_name>-</first_name>
                  <middle_name>-</middle_name>
                  <prefix>-</prefix>
                  <last_name>-</last_name>
                </person>
              </person_related_person>
            </related_persons>
            <re_relationship>
              <relationship_date_range>
                <valid_from>1900-01-01T00:00:00</valid_from>
              </relationship_date_range>
            </re_relationship>
            <additional_information>
              <additional_info>
                <info_subject>-</info_subject>
              </additional_info>
            </additional_information>
            <comments />
            <role>-</role>
          </director_id>
          <related_entities>
            <entity_related_entity>
              <entity_entity_relation />
              <entity>
                <name>-</name>
              </entity>
            </entity_related_entity>
          </related_entities>
          <incorporation_date>1900-01-01T00:00:00</incorporation_date>
        </entity_my_client>
        <foreign_currency>
          <foreign_currency_code>-</foreign_currency_code>
          <foreign_amount>0</foreign_amount>
          <foreign_exchange_rate>0</foreign_exchange_rate>
        </foreign_currency>
        <country>-</country>
      </party>
    </involved_parties>
  </transaction>
  <report_indicators>
    <indicator>-</indicator>
  </report_indicators>
  <additional_information>
    <additional_info>
      <info_subject>-</info_subject>
    </additional_info>
  </additional_information>
</report>
<report>
  <schema_version>5.1</schema_version>
  <rentity_id>4</rentity_id>
  <rentity_branch>Service Center C4C Branch</rentity_branch>
  <submission_code>E</submission_code>
  <report_code>CTR</report_code>
  <submission_date>2023-04-11T00:00:00</submission_date>
  <currency_code_local>GHC</currency_code_local>
  <reporting_user_code>Edith</reporting_user_code>
  <location>
    <address_type>-</address_type>
    <address>-</address>
    <additional_address_line1>-</additional_address_line1>
    <additional_address_line2>-</additional_address_line2>
    <city>-</city>
    <zip />
    <country_code>GH</country_code>
  </location>
  <transaction>
    <transactionnumber>20020906786</transactionnumber>
    <transaction_is_suspicious>false</transaction_is_suspicious>
    <agent_name>Edem Ankah</agent_name>
    <transaction_location />
    <transaction_description>CASH DEP BY ASAFO-AGYEI JOSHUA</transaction_description>
    <date_transaction>2023-04-11T00:00:00</date_transaction>
    <teller>Daniel Amoako</teller>
    <authorized>Daniel Amoako</authorized>
    <transaction_type_code>2023-04-11T00:00:00</transaction_type_code>
    <transmode_code>A</transmode_code>
    <transmode_comment>-</transmode_comment>
    <amount_local>50000.0000</amount_local>
    <transaction_status>C</transaction_status>
    <involved_parties>
      <party>
        <role>-</role>
        <entity_my_client>
          <name>HONJOE COMPANY LIMITED</name>
          <commercial_name>-</commercial_name>
          <incorporation_legal_form>-</incorporation_legal_form>
          <incorporation_number>-</incorporation_number>
          <business>-</business>
          <entity_status>---</entity_status>
          <entity_status_date>1900-01-01T00:00:00</entity_status_date>
          <phones>
            <phone>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </phone>
          </phones>
          <addresses>
            <address>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>---</city>
              <zip />
              <country_code>GH</country_code>
            </address>
          </addresses>
          <network_devices>
            <network_device>
              <device_number />
              <ip_address>
                <ipv4>172.18.18.81</ipv4>
              </ip_address>
            </network_device>
          </network_devices>
          <email />
          <url />
          <incorporation_state />
          <incorporation_country_code>-</incorporation_country_code>
          <director_id>
            <gender>-</gender>
            <title />
            <first_name>-</first_name>
            <middle_name>-</middle_name>
            <prefix>-</prefix>
            <last_name>-</last_name>
            <birthdate>1900-01-01T00:00:00</birthdate>
            <birth_place />
            <country_of_birth>-</country_of_birth>
            <mothers_name />
            <alias />
            <full_name_frn>-</full_name_frn>
            <previous_names>
              <previous_name>
                <first_name>-</first_name>
                <last_name>-</last_name>
              </previous_name>
            </previous_names>
            <ssn />
            <passport_number>-</passport_number>
            <passport_country>-</passport_country>
            <id_number />
            <nationality1>-</nationality1>
            <nationality2>-</nationality2>
            <nationality3>-</nationality3>
            <residence>-</residence>
            <residence_since>1900-01-01T00:00:00</residence_since>
            <phones />
            <addresses />
            <network_devices>
              <network_device>
                <device_number />
                <ip_address>
                  <ipv4>172.18.18.81</ipv4>
                </ip_address>
              </network_device>
            </network_devices>
            <email>-----</email>
            <social_media>
              <social_account>
                <platform />
                <user_name />
              </social_account>
            </social_media>
            <occupation>-</occupation>
            <employer_name>-</employer_name>
            <employer_address_id>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>-</city>
              <zip />
              <country_code>GH</country_code>
            </employer_address_id>
            <employer_phone_id>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </employer_phone_id>
            <identifications>
              <identification>
                <type>-</type>
                <number />
                <issued_by />
                <issue_country>-</issue_country>
              </identification>
            </identifications>
            <deceased />
            <date_deceased>1900-01-01T00:00:00</date_deceased>
            <tax_number>-</tax_number>
            <tax_reg_number>-</tax_reg_number>
            <source_of_wealth />
            <peps>
              <pep>
                <pep_country>-</pep_country>
              </pep>
            </peps>
            <is_protected>true</is_protected>
            <sanctions>
              <sanction_list>
                <provider />
                <sanction_list_name />
              </sanction_list>
            </sanctions>
            <related_persons>
              <person_related_person>
                <person_person_relation>-</person_person_relation>
                <person>
                  <gender>-</gender>
                  <title />
                  <first_name>-</first_name>
                  <middle_name>-</middle_name>
                  <prefix>-</prefix>
                  <last_name>-</last_name>
                </person>
              </person_related_person>
            </related_persons>
            <re_relationship>
              <relationship_date_range>
                <valid_from>1900-01-01T00:00:00</valid_from>
              </relationship_date_range>
            </re_relationship>
            <additional_information>
              <additional_info>
                <info_subject>-</info_subject>
              </additional_info>
            </additional_information>
            <comments />
            <role>-</role>
          </director_id>
          <related_entities>
            <entity_related_entity>
              <entity_entity_relation />
              <entity>
                <name>-</name>
              </entity>
            </entity_related_entity>
          </related_entities>
          <incorporation_date>1900-01-01T00:00:00</incorporation_date>
        </entity_my_client>
        <foreign_currency>
          <foreign_currency_code>-</foreign_currency_code>
          <foreign_amount>0</foreign_amount>
          <foreign_exchange_rate>0</foreign_exchange_rate>
        </foreign_currency>
        <country>-</country>
      </party>
    </involved_parties>
  </transaction>
  <report_indicators>
    <indicator>-</indicator>
  </report_indicators>
  <additional_information>
    <additional_info>
      <info_subject>-</info_subject>
    </additional_info>
  </additional_information>
</report>
<report>
  <schema_version>5.1</schema_version>
  <rentity_id>5</rentity_id>
  <rentity_branch>Kumasi Retail Branch</rentity_branch>
  <submission_code>E</submission_code>
  <report_code>CTR</report_code>
  <submission_date>2023-04-11T00:00:00</submission_date>
  <currency_code_local>GHC</currency_code_local>
  <reporting_user_code>Edith</reporting_user_code>
  <location>
    <address_type>-</address_type>
    <address>-</address>
    <additional_address_line1>-</additional_address_line1>
    <additional_address_line2>-</additional_address_line2>
    <city>-</city>
    <zip />
    <country_code>GH</country_code>
  </location>
  <transaction>
    <transactionnumber>20020908542</transactionnumber>
    <transaction_is_suspicious>false</transaction_is_suspicious>
    <agent_name>Nana Siaw</agent_name>
    <transaction_location />
    <transaction_description>cash deposit by Beatrice Yeboah Tiwaa</transaction_description>
    <date_transaction>2023-04-11T00:00:00</date_transaction>
    <teller>Benjamin Duut</teller>
    <authorized>Benjamin Duut</authorized>
    <transaction_type_code>2023-04-11T00:00:00</transaction_type_code>
    <transmode_code>A</transmode_code>
    <transmode_comment>-</transmode_comment>
    <amount_local>60000.0000</amount_local>
    <transaction_status>C</transaction_status>
    <involved_parties>
      <party>
        <role>-</role>
        <entity_my_client>
          <name>-</name>
          <commercial_name>-</commercial_name>
          <incorporation_legal_form>-</incorporation_legal_form>
          <incorporation_number>-</incorporation_number>
          <business>-</business>
          <entity_status>---</entity_status>
          <entity_status_date>1900-01-01T00:00:00</entity_status_date>
          <phones>
            <phone>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </phone>
          </phones>
          <addresses>
            <address>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>---</city>
              <zip />
              <country_code>GH</country_code>
            </address>
          </addresses>
          <network_devices>
            <network_device>
              <device_number />
              <ip_address>
                <ipv4>172.18.18.81</ipv4>
              </ip_address>
            </network_device>
          </network_devices>
          <email />
          <url />
          <incorporation_state />
          <incorporation_country_code>-</incorporation_country_code>
          <director_id>
            <gender>-</gender>
            <title />
            <first_name>-</first_name>
            <middle_name>-</middle_name>
            <prefix>-</prefix>
            <last_name>-</last_name>
            <birthdate>1900-01-01T00:00:00</birthdate>
            <birth_place />
            <country_of_birth>-</country_of_birth>
            <mothers_name />
            <alias />
            <full_name_frn>-</full_name_frn>
            <previous_names>
              <previous_name>
                <first_name>-</first_name>
                <last_name>-</last_name>
              </previous_name>
            </previous_names>
            <ssn />
            <passport_number>-</passport_number>
            <passport_country>-</passport_country>
            <id_number />
            <nationality1>-</nationality1>
            <nationality2>-</nationality2>
            <nationality3>-</nationality3>
            <residence>-</residence>
            <residence_since>1900-01-01T00:00:00</residence_since>
            <phones />
            <addresses />
            <network_devices>
              <network_device>
                <device_number />
                <ip_address>
                  <ipv4>172.18.18.81</ipv4>
                </ip_address>
              </network_device>
            </network_devices>
            <email>-----</email>
            <social_media>
              <social_account>
                <platform />
                <user_name />
              </social_account>
            </social_media>
            <occupation>-</occupation>
            <employer_name>-</employer_name>
            <employer_address_id>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>-</city>
              <zip />
              <country_code>GH</country_code>
            </employer_address_id>
            <employer_phone_id>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </employer_phone_id>
            <identifications>
              <identification>
                <type>-</type>
                <number />
                <issued_by />
                <issue_country>-</issue_country>
              </identification>
            </identifications>
            <deceased />
            <date_deceased>1900-01-01T00:00:00</date_deceased>
            <tax_number>-</tax_number>
            <tax_reg_number>-</tax_reg_number>
            <source_of_wealth />
            <peps>
              <pep>
                <pep_country>-</pep_country>
              </pep>
            </peps>
            <is_protected>true</is_protected>
            <sanctions>
              <sanction_list>
                <provider />
                <sanction_list_name />
              </sanction_list>
            </sanctions>
            <related_persons>
              <person_related_person>
                <person_person_relation>-</person_person_relation>
                <person>
                  <gender>-</gender>
                  <title />
                  <first_name>-</first_name>
                  <middle_name>-</middle_name>
                  <prefix>-</prefix>
                  <last_name>-</last_name>
                </person>
              </person_related_person>
            </related_persons>
            <re_relationship>
              <relationship_date_range>
                <valid_from>1900-01-01T00:00:00</valid_from>
              </relationship_date_range>
            </re_relationship>
            <additional_information>
              <additional_info>
                <info_subject>-</info_subject>
              </additional_info>
            </additional_information>
            <comments />
            <role>-</role>
          </director_id>
          <related_entities>
            <entity_related_entity>
              <entity_entity_relation />
              <entity>
                <name>-</name>
              </entity>
            </entity_related_entity>
          </related_entities>
          <incorporation_date>1900-01-01T00:00:00</incorporation_date>
        </entity_my_client>
        <foreign_currency>
          <foreign_currency_code>-</foreign_currency_code>
          <foreign_amount>0</foreign_amount>
          <foreign_exchange_rate>0</foreign_exchange_rate>
        </foreign_currency>
        <country>-</country>
      </party>
    </involved_parties>
  </transaction>
  <report_indicators>
    <indicator>-</indicator>
  </report_indicators>
  <additional_information>
    <additional_info>
      <info_subject>-</info_subject>
    </additional_info>
  </additional_information>
</report>
<report>
  <schema_version>5.1</schema_version>
  <rentity_id>6</rentity_id>
  <rentity_branch>Accra Retail Branch</rentity_branch>
  <submission_code>E</submission_code>
  <report_code>CTR</report_code>
  <submission_date>2023-04-11T00:00:00</submission_date>
  <currency_code_local>GHC</currency_code_local>
  <reporting_user_code>Edith</reporting_user_code>
  <location>
    <address_type>-</address_type>
    <address>-</address>
    <additional_address_line1>-</additional_address_line1>
    <additional_address_line2>-</additional_address_line2>
    <city>ACCRA</city>
    <zip />
    <country_code>GH</country_code>
  </location>
  <transaction>
    <transactionnumber>20020908533</transactionnumber>
    <transaction_is_suspicious>false</transaction_is_suspicious>
    <agent_name>Samuel Otoo</agent_name>
    <transaction_location />
    <transaction_description>CASH DEP BY CLAUDIA</transaction_description>
    <date_transaction>2023-04-11T00:00:00</date_transaction>
    <teller>Stephen Mensah</teller>
    <authorized>Stephen Mensah</authorized>
    <transaction_type_code>2023-04-11T00:00:00</transaction_type_code>
    <transmode_code>A</transmode_code>
    <transmode_comment>-</transmode_comment>
    <amount_local>26000.0000</amount_local>
    <transaction_status>C</transaction_status>
    <involved_parties>
      <party>
        <role>-</role>
        <entity_my_client>
          <name>HUMASHMORO ENTERPRISE</name>
          <commercial_name>-</commercial_name>
          <incorporation_legal_form>-</incorporation_legal_form>
          <incorporation_number>-</incorporation_number>
          <business>-</business>
          <entity_status>---</entity_status>
          <entity_status_date>1900-01-01T00:00:00</entity_status_date>
          <phones>
            <phone>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </phone>
          </phones>
          <addresses>
            <address>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>---</city>
              <zip />
              <country_code>GH</country_code>
            </address>
          </addresses>
          <network_devices>
            <network_device>
              <device_number />
              <ip_address>
                <ipv4>172.18.18.81</ipv4>
              </ip_address>
            </network_device>
          </network_devices>
          <email />
          <url />
          <incorporation_state />
          <incorporation_country_code>-</incorporation_country_code>
          <director_id>
            <gender>-</gender>
            <title />
            <first_name>-</first_name>
            <middle_name>-</middle_name>
            <prefix>-</prefix>
            <last_name>-</last_name>
            <birthdate>1900-01-01T00:00:00</birthdate>
            <birth_place />
            <country_of_birth>-</country_of_birth>
            <mothers_name />
            <alias />
            <full_name_frn>-</full_name_frn>
            <previous_names>
              <previous_name>
                <first_name>-</first_name>
                <last_name>-</last_name>
              </previous_name>
            </previous_names>
            <ssn />
            <passport_number>-</passport_number>
            <passport_country>-</passport_country>
            <id_number />
            <nationality1>-</nationality1>
            <nationality2>-</nationality2>
            <nationality3>-</nationality3>
            <residence>-</residence>
            <residence_since>1900-01-01T00:00:00</residence_since>
            <phones />
            <addresses />
            <network_devices>
              <network_device>
                <device_number />
                <ip_address>
                  <ipv4>172.18.18.81</ipv4>
                </ip_address>
              </network_device>
            </network_devices>
            <email>-----</email>
            <social_media>
              <social_account>
                <platform />
                <user_name />
              </social_account>
            </social_media>
            <occupation>-</occupation>
            <employer_name>-</employer_name>
            <employer_address_id>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>-</city>
              <zip />
              <country_code>GH</country_code>
            </employer_address_id>
            <employer_phone_id>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </employer_phone_id>
            <identifications>
              <identification>
                <type>-</type>
                <number />
                <issued_by />
                <issue_country>-</issue_country>
              </identification>
            </identifications>
            <deceased />
            <date_deceased>1900-01-01T00:00:00</date_deceased>
            <tax_number>-</tax_number>
            <tax_reg_number>-</tax_reg_number>
            <source_of_wealth />
            <peps>
              <pep>
                <pep_country>-</pep_country>
              </pep>
            </peps>
            <is_protected>true</is_protected>
            <sanctions>
              <sanction_list>
                <provider />
                <sanction_list_name />
              </sanction_list>
            </sanctions>
            <related_persons>
              <person_related_person>
                <person_person_relation>-</person_person_relation>
                <person>
                  <gender>-</gender>
                  <title />
                  <first_name>-</first_name>
                  <middle_name>-</middle_name>
                  <prefix>-</prefix>
                  <last_name>-</last_name>
                </person>
              </person_related_person>
            </related_persons>
            <re_relationship>
              <relationship_date_range>
                <valid_from>1900-01-01T00:00:00</valid_from>
              </relationship_date_range>
            </re_relationship>
            <additional_information>
              <additional_info>
                <info_subject>-</info_subject>
              </additional_info>
            </additional_information>
            <comments />
            <role>-</role>
          </director_id>
          <related_entities>
            <entity_related_entity>
              <entity_entity_relation />
              <entity>
                <name>-</name>
              </entity>
            </entity_related_entity>
          </related_entities>
          <incorporation_date>1900-01-01T00:00:00</incorporation_date>
        </entity_my_client>
        <foreign_currency>
          <foreign_currency_code>-</foreign_currency_code>
          <foreign_amount>0</foreign_amount>
          <foreign_exchange_rate>0</foreign_exchange_rate>
        </foreign_currency>
        <country>-</country>
      </party>
    </involved_parties>
  </transaction>
  <report_indicators>
    <indicator>-</indicator>
  </report_indicators>
  <additional_information>
    <additional_info>
      <info_subject>-</info_subject>
    </additional_info>
  </additional_information>
</report>
<report>
  <schema_version>5.1</schema_version>
  <rentity_id>7</rentity_id>
  <rentity_branch>Kumasi Retail Branch</rentity_branch>
  <submission_code>E</submission_code>
  <report_code>CTR</report_code>
  <submission_date>2023-04-11T00:00:00</submission_date>
  <currency_code_local>GHC</currency_code_local>
  <reporting_user_code>Edith</reporting_user_code>
  <location>
    <address_type>-</address_type>
    <address>-</address>
    <additional_address_line1>-</additional_address_line1>
    <additional_address_line2>-</additional_address_line2>
    <city>KUMASI</city>
    <zip />
    <country_code>GH</country_code>
  </location>
  <transaction>
    <transactionnumber>20020906683</transactionnumber>
    <transaction_is_suspicious>false</transaction_is_suspicious>
    <agent_name>Nana Siaw</agent_name>
    <transaction_location />
    <transaction_description>cash deposit by Kwame Owusu Acheampong</transaction_description>
    <date_transaction>2023-04-11T00:00:00</date_transaction>
    <teller>JULIET ASANTE</teller>
    <authorized>JULIET ASANTE</authorized>
    <transaction_type_code>2023-04-11T00:00:00</transaction_type_code>
    <transmode_code>A</transmode_code>
    <transmode_comment>-</transmode_comment>
    <amount_local>20000.0000</amount_local>
    <transaction_status>C</transaction_status>
    <involved_parties>
      <party>
        <role>-</role>
        <entity_my_client>
          <name>MASLENDA LIMITED</name>
          <commercial_name>-</commercial_name>
          <incorporation_legal_form>-</incorporation_legal_form>
          <incorporation_number>-</incorporation_number>
          <business>-</business>
          <entity_status>---</entity_status>
          <entity_status_date>1900-01-01T00:00:00</entity_status_date>
          <phones>
            <phone>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </phone>
          </phones>
          <addresses>
            <address>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>---</city>
              <zip />
              <country_code>GH</country_code>
            </address>
          </addresses>
          <network_devices>
            <network_device>
              <device_number />
              <ip_address>
                <ipv4>172.18.18.81</ipv4>
              </ip_address>
            </network_device>
          </network_devices>
          <email />
          <url />
          <incorporation_state />
          <incorporation_country_code>-</incorporation_country_code>
          <director_id>
            <gender>-</gender>
            <title />
            <first_name>-</first_name>
            <middle_name>-</middle_name>
            <prefix>-</prefix>
            <last_name>-</last_name>
            <birthdate>1900-01-01T00:00:00</birthdate>
            <birth_place />
            <country_of_birth>-</country_of_birth>
            <mothers_name />
            <alias />
            <full_name_frn>-</full_name_frn>
            <previous_names>
              <previous_name>
                <first_name>-</first_name>
                <last_name>-</last_name>
              </previous_name>
            </previous_names>
            <ssn />
            <passport_number>-</passport_number>
            <passport_country>-</passport_country>
            <id_number />
            <nationality1>-</nationality1>
            <nationality2>-</nationality2>
            <nationality3>-</nationality3>
            <residence>-</residence>
            <residence_since>1900-01-01T00:00:00</residence_since>
            <phones />
            <addresses />
            <network_devices>
              <network_device>
                <device_number />
                <ip_address>
                  <ipv4>172.18.18.81</ipv4>
                </ip_address>
              </network_device>
            </network_devices>
            <email>-----</email>
            <social_media>
              <social_account>
                <platform />
                <user_name />
              </social_account>
            </social_media>
            <occupation>-</occupation>
            <employer_name>-</employer_name>
            <employer_address_id>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>-</city>
              <zip />
              <country_code>GH</country_code>
            </employer_address_id>
            <employer_phone_id>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </employer_phone_id>
            <identifications>
              <identification>
                <type>-</type>
                <number />
                <issued_by />
                <issue_country>-</issue_country>
              </identification>
            </identifications>
            <deceased />
            <date_deceased>1900-01-01T00:00:00</date_deceased>
            <tax_number>-</tax_number>
            <tax_reg_number>-</tax_reg_number>
            <source_of_wealth />
            <peps>
              <pep>
                <pep_country>-</pep_country>
              </pep>
            </peps>
            <is_protected>true</is_protected>
            <sanctions>
              <sanction_list>
                <provider />
                <sanction_list_name />
              </sanction_list>
            </sanctions>
            <related_persons>
              <person_related_person>
                <person_person_relation>-</person_person_relation>
                <person>
                  <gender>-</gender>
                  <title />
                  <first_name>-</first_name>
                  <middle_name>-</middle_name>
                  <prefix>-</prefix>
                  <last_name>-</last_name>
                </person>
              </person_related_person>
            </related_persons>
            <re_relationship>
              <relationship_date_range>
                <valid_from>1900-01-01T00:00:00</valid_from>
              </relationship_date_range>
            </re_relationship>
            <additional_information>
              <additional_info>
                <info_subject>-</info_subject>
              </additional_info>
            </additional_information>
            <comments />
            <role>-</role>
          </director_id>
          <related_entities>
            <entity_related_entity>
              <entity_entity_relation />
              <entity>
                <name>-</name>
              </entity>
            </entity_related_entity>
          </related_entities>
          <incorporation_date>1900-01-01T00:00:00</incorporation_date>
        </entity_my_client>
        <foreign_currency>
          <foreign_currency_code>-</foreign_currency_code>
          <foreign_amount>0</foreign_amount>
          <foreign_exchange_rate>0</foreign_exchange_rate>
        </foreign_currency>
        <country>-</country>
      </party>
    </involved_parties>
  </transaction>
  <report_indicators>
    <indicator>-</indicator>
  </report_indicators>
  <additional_information>
    <additional_info>
      <info_subject>-</info_subject>
    </additional_info>
  </additional_information>
</report>
<report>
  <schema_version>5.1</schema_version>
  <rentity_id>8</rentity_id>
  <rentity_branch>Kumasi Retail Branch</rentity_branch>
  <submission_code>E</submission_code>
  <report_code>CTR</report_code>
  <submission_date>2023-04-11T00:00:00</submission_date>
  <currency_code_local>GHC</currency_code_local>
  <reporting_user_code>Edith</reporting_user_code>
  <location>
    <address_type>-</address_type>
    <address>-</address>
    <additional_address_line1>-</additional_address_line1>
    <additional_address_line2>-</additional_address_line2>
    <city>KUMASI</city>
    <zip />
    <country_code>GH</country_code>
  </location>
  <transaction>
    <transactionnumber>20020907440</transactionnumber>
    <transaction_is_suspicious>false</transaction_is_suspicious>
    <agent_name>Samuel Twumasi-Ankrah</agent_name>
    <transaction_location />
    <transaction_description>cash deposit by Alexander Adu Gyamfi</transaction_description>
    <date_transaction>2023-04-11T00:00:00</date_transaction>
    <teller>JULIET ASANTE</teller>
    <authorized>JULIET ASANTE</authorized>
    <transaction_type_code>2023-04-11T00:00:00</transaction_type_code>
    <transmode_code>A</transmode_code>
    <transmode_comment>-</transmode_comment>
    <amount_local>43280.0000</amount_local>
    <transaction_status>C</transaction_status>
    <involved_parties>
      <party>
        <role>-</role>
        <entity_my_client>
          <name>Gyamdulex</name>
          <commercial_name>-</commercial_name>
          <incorporation_legal_form>-</incorporation_legal_form>
          <incorporation_number>-</incorporation_number>
          <business>-</business>
          <entity_status>---</entity_status>
          <entity_status_date>1900-01-01T00:00:00</entity_status_date>
          <phones>
            <phone>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </phone>
          </phones>
          <addresses>
            <address>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>---</city>
              <zip />
              <country_code>GH</country_code>
            </address>
          </addresses>
          <network_devices>
            <network_device>
              <device_number />
              <ip_address>
                <ipv4>172.18.18.81</ipv4>
              </ip_address>
            </network_device>
          </network_devices>
          <email />
          <url />
          <incorporation_state />
          <incorporation_country_code>-</incorporation_country_code>
          <director_id>
            <gender>-</gender>
            <title />
            <first_name>-</first_name>
            <middle_name>-</middle_name>
            <prefix>-</prefix>
            <last_name>-</last_name>
            <birthdate>1900-01-01T00:00:00</birthdate>
            <birth_place />
            <country_of_birth>-</country_of_birth>
            <mothers_name />
            <alias />
            <full_name_frn>-</full_name_frn>
            <previous_names>
              <previous_name>
                <first_name>-</first_name>
                <last_name>-</last_name>
              </previous_name>
            </previous_names>
            <ssn />
            <passport_number>-</passport_number>
            <passport_country>-</passport_country>
            <id_number />
            <nationality1>-</nationality1>
            <nationality2>-</nationality2>
            <nationality3>-</nationality3>
            <residence>-</residence>
            <residence_since>1900-01-01T00:00:00</residence_since>
            <phones />
            <addresses />
            <network_devices>
              <network_device>
                <device_number />
                <ip_address>
                  <ipv4>172.18.18.81</ipv4>
                </ip_address>
              </network_device>
            </network_devices>
            <email>-----</email>
            <social_media>
              <social_account>
                <platform />
                <user_name />
              </social_account>
            </social_media>
            <occupation>-</occupation>
            <employer_name>-</employer_name>
            <employer_address_id>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>-</city>
              <zip />
              <country_code>GH</country_code>
            </employer_address_id>
            <employer_phone_id>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </employer_phone_id>
            <identifications>
              <identification>
                <type>-</type>
                <number />
                <issued_by />
                <issue_country>-</issue_country>
              </identification>
            </identifications>
            <deceased />
            <date_deceased>1900-01-01T00:00:00</date_deceased>
            <tax_number>-</tax_number>
            <tax_reg_number>-</tax_reg_number>
            <source_of_wealth />
            <peps>
              <pep>
                <pep_country>-</pep_country>
              </pep>
            </peps>
            <is_protected>true</is_protected>
            <sanctions>
              <sanction_list>
                <provider />
                <sanction_list_name />
              </sanction_list>
            </sanctions>
            <related_persons>
              <person_related_person>
                <person_person_relation>-</person_person_relation>
                <person>
                  <gender>-</gender>
                  <title />
                  <first_name>-</first_name>
                  <middle_name>-</middle_name>
                  <prefix>-</prefix>
                  <last_name>-</last_name>
                </person>
              </person_related_person>
            </related_persons>
            <re_relationship>
              <relationship_date_range>
                <valid_from>1900-01-01T00:00:00</valid_from>
              </relationship_date_range>
            </re_relationship>
            <additional_information>
              <additional_info>
                <info_subject>-</info_subject>
              </additional_info>
            </additional_information>
            <comments />
            <role>-</role>
          </director_id>
          <related_entities>
            <entity_related_entity>
              <entity_entity_relation />
              <entity>
                <name>-</name>
              </entity>
            </entity_related_entity>
          </related_entities>
          <incorporation_date>1900-01-01T00:00:00</incorporation_date>
        </entity_my_client>
        <foreign_currency>
          <foreign_currency_code>-</foreign_currency_code>
          <foreign_amount>0</foreign_amount>
          <foreign_exchange_rate>0</foreign_exchange_rate>
        </foreign_currency>
        <country>-</country>
      </party>
    </involved_parties>
  </transaction>
  <report_indicators>
    <indicator>-</indicator>
  </report_indicators>
  <additional_information>
    <additional_info>
      <info_subject>-</info_subject>
    </additional_info>
  </additional_information>
</report>
<report>
  <schema_version>5.1</schema_version>
  <rentity_id>9</rentity_id>
  <rentity_branch>Service Center Branch</rentity_branch>
  <submission_code>E</submission_code>
  <report_code>CTR</report_code>
  <submission_date>2023-04-11T00:00:00</submission_date>
  <currency_code_local>GHC</currency_code_local>
  <reporting_user_code>Edith</reporting_user_code>
  <location>
    <address_type>-</address_type>
    <address>-</address>
    <additional_address_line1>-</additional_address_line1>
    <additional_address_line2>-</additional_address_line2>
    <city>KOTOBABI</city>
    <zip />
    <country_code>GH</country_code>
  </location>
  <transaction>
    <transactionnumber>20020907680</transactionnumber>
    <transaction_is_suspicious>false</transaction_is_suspicious>
    <agent_name>Daniella Dorcoo</agent_name>
    <transaction_location />
    <transaction_description>CASH DEP BY DIVINE JIAGGEY</transaction_description>
    <date_transaction>2023-04-11T00:00:00</date_transaction>
    <teller>Dorothy Arthur</teller>
    <authorized>Dorothy Arthur</authorized>
    <transaction_type_code>2023-04-11T00:00:00</transaction_type_code>
    <transmode_code>A</transmode_code>
    <transmode_comment>-</transmode_comment>
    <amount_local>45150.0000</amount_local>
    <transaction_status>C</transaction_status>
    <involved_parties>
      <party>
        <role>-</role>
        <entity_my_client>
          <name>-</name>
          <commercial_name>-</commercial_name>
          <incorporation_legal_form>-</incorporation_legal_form>
          <incorporation_number>-</incorporation_number>
          <business>-</business>
          <entity_status>---</entity_status>
          <entity_status_date>1900-01-01T00:00:00</entity_status_date>
          <phones>
            <phone>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </phone>
          </phones>
          <addresses>
            <address>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>---</city>
              <zip />
              <country_code>GH</country_code>
            </address>
          </addresses>
          <network_devices>
            <network_device>
              <device_number />
              <ip_address>
                <ipv4>172.18.18.81</ipv4>
              </ip_address>
            </network_device>
          </network_devices>
          <email />
          <url />
          <incorporation_state />
          <incorporation_country_code>-</incorporation_country_code>
          <director_id>
            <gender>-</gender>
            <title />
            <first_name>-</first_name>
            <middle_name>-</middle_name>
            <prefix>-</prefix>
            <last_name>-</last_name>
            <birthdate>1900-01-01T00:00:00</birthdate>
            <birth_place />
            <country_of_birth>-</country_of_birth>
            <mothers_name />
            <alias />
            <full_name_frn>-</full_name_frn>
            <previous_names>
              <previous_name>
                <first_name>-</first_name>
                <last_name>-</last_name>
              </previous_name>
            </previous_names>
            <ssn />
            <passport_number>-</passport_number>
            <passport_country>-</passport_country>
            <id_number />
            <nationality1>-</nationality1>
            <nationality2>-</nationality2>
            <nationality3>-</nationality3>
            <residence>-</residence>
            <residence_since>1900-01-01T00:00:00</residence_since>
            <phones />
            <addresses />
            <network_devices>
              <network_device>
                <device_number />
                <ip_address>
                  <ipv4>172.18.18.81</ipv4>
                </ip_address>
              </network_device>
            </network_devices>
            <email>-----</email>
            <social_media>
              <social_account>
                <platform />
                <user_name />
              </social_account>
            </social_media>
            <occupation>-</occupation>
            <employer_name>-</employer_name>
            <employer_address_id>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>-</city>
              <zip />
              <country_code>GH</country_code>
            </employer_address_id>
            <employer_phone_id>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </employer_phone_id>
            <identifications>
              <identification>
                <type>-</type>
                <number />
                <issued_by />
                <issue_country>-</issue_country>
              </identification>
            </identifications>
            <deceased />
            <date_deceased>1900-01-01T00:00:00</date_deceased>
            <tax_number>-</tax_number>
            <tax_reg_number>-</tax_reg_number>
            <source_of_wealth />
            <peps>
              <pep>
                <pep_country>-</pep_country>
              </pep>
            </peps>
            <is_protected>true</is_protected>
            <sanctions>
              <sanction_list>
                <provider />
                <sanction_list_name />
              </sanction_list>
            </sanctions>
            <related_persons>
              <person_related_person>
                <person_person_relation>-</person_person_relation>
                <person>
                  <gender>-</gender>
                  <title />
                  <first_name>-</first_name>
                  <middle_name>-</middle_name>
                  <prefix>-</prefix>
                  <last_name>-</last_name>
                </person>
              </person_related_person>
            </related_persons>
            <re_relationship>
              <relationship_date_range>
                <valid_from>1900-01-01T00:00:00</valid_from>
              </relationship_date_range>
            </re_relationship>
            <additional_information>
              <additional_info>
                <info_subject>-</info_subject>
              </additional_info>
            </additional_information>
            <comments />
            <role>-</role>
          </director_id>
          <related_entities>
            <entity_related_entity>
              <entity_entity_relation />
              <entity>
                <name>-</name>
              </entity>
            </entity_related_entity>
          </related_entities>
          <incorporation_date>1900-01-01T00:00:00</incorporation_date>
        </entity_my_client>
        <foreign_currency>
          <foreign_currency_code>-</foreign_currency_code>
          <foreign_amount>0</foreign_amount>
          <foreign_exchange_rate>0</foreign_exchange_rate>
        </foreign_currency>
        <country>-</country>
      </party>
    </involved_parties>
  </transaction>
  <report_indicators>
    <indicator>-</indicator>
  </report_indicators>
  <additional_information>
    <additional_info>
      <info_subject>-</info_subject>
    </additional_info>
  </additional_information>
</report>
<report>
  <schema_version>5.1</schema_version>
  <rentity_id>10</rentity_id>
  <rentity_branch>Suame Branch</rentity_branch>
  <submission_code>E</submission_code>
  <report_code>CTR</report_code>
  <submission_date>2023-04-11T00:00:00</submission_date>
  <currency_code_local>GHC</currency_code_local>
  <reporting_user_code>Edith</reporting_user_code>
  <location>
    <address_type>-</address_type>
    <address>-</address>
    <additional_address_line1>-</additional_address_line1>
    <additional_address_line2>-</additional_address_line2>
    <city>ASHANTI</city>
    <zip />
    <country_code>GH</country_code>
  </location>
  <transaction>
    <transactionnumber>20020906642</transactionnumber>
    <transaction_is_suspicious>false</transaction_is_suspicious>
    <agent_name>KWARTEMAA SARFO</agent_name>
    <transaction_location />
    <transaction_description>CASH DEPOSIT BY ELIZABETH ANINWAAH</transaction_description>
    <date_transaction>2023-04-11T00:00:00</date_transaction>
    <teller>Georgina Acheampomaa</teller>
    <authorized>Georgina Acheampomaa</authorized>
    <transaction_type_code>2023-04-11T00:00:00</transaction_type_code>
    <transmode_code>A</transmode_code>
    <transmode_comment>-</transmode_comment>
    <amount_local>25000.0000</amount_local>
    <transaction_status>C</transaction_status>
    <involved_parties>
      <party>
        <role>-</role>
        <entity_my_client>
          <name>-</name>
          <commercial_name>-</commercial_name>
          <incorporation_legal_form>-</incorporation_legal_form>
          <incorporation_number>-</incorporation_number>
          <business>-</business>
          <entity_status>---</entity_status>
          <entity_status_date>1900-01-01T00:00:00</entity_status_date>
          <phones>
            <phone>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </phone>
          </phones>
          <addresses>
            <address>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>---</city>
              <zip />
              <country_code>GH</country_code>
            </address>
          </addresses>
          <network_devices>
            <network_device>
              <device_number />
              <ip_address>
                <ipv4>172.18.18.81</ipv4>
              </ip_address>
            </network_device>
          </network_devices>
          <email />
          <url />
          <incorporation_state />
          <incorporation_country_code>-</incorporation_country_code>
          <director_id>
            <gender>-</gender>
            <title />
            <first_name>-</first_name>
            <middle_name>-</middle_name>
            <prefix>-</prefix>
            <last_name>-</last_name>
            <birthdate>1900-01-01T00:00:00</birthdate>
            <birth_place />
            <country_of_birth>-</country_of_birth>
            <mothers_name />
            <alias />
            <full_name_frn>-</full_name_frn>
            <previous_names>
              <previous_name>
                <first_name>-</first_name>
                <last_name>-</last_name>
              </previous_name>
            </previous_names>
            <ssn />
            <passport_number>-</passport_number>
            <passport_country>-</passport_country>
            <id_number />
            <nationality1>-</nationality1>
            <nationality2>-</nationality2>
            <nationality3>-</nationality3>
            <residence>-</residence>
            <residence_since>1900-01-01T00:00:00</residence_since>
            <phones />
            <addresses />
            <network_devices>
              <network_device>
                <device_number />
                <ip_address>
                  <ipv4>172.18.18.81</ipv4>
                </ip_address>
              </network_device>
            </network_devices>
            <email>-----</email>
            <social_media>
              <social_account>
                <platform />
                <user_name />
              </social_account>
            </social_media>
            <occupation>-</occupation>
            <employer_name>-</employer_name>
            <employer_address_id>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>-</city>
              <zip />
              <country_code>GH</country_code>
            </employer_address_id>
            <employer_phone_id>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </employer_phone_id>
            <identifications>
              <identification>
                <type>-</type>
                <number />
                <issued_by />
                <issue_country>-</issue_country>
              </identification>
            </identifications>
            <deceased />
            <date_deceased>1900-01-01T00:00:00</date_deceased>
            <tax_number>-</tax_number>
            <tax_reg_number>-</tax_reg_number>
            <source_of_wealth />
            <peps>
              <pep>
                <pep_country>-</pep_country>
              </pep>
            </peps>
            <is_protected>true</is_protected>
            <sanctions>
              <sanction_list>
                <provider />
                <sanction_list_name />
              </sanction_list>
            </sanctions>
            <related_persons>
              <person_related_person>
                <person_person_relation>-</person_person_relation>
                <person>
                  <gender>-</gender>
                  <title />
                  <first_name>-</first_name>
                  <middle_name>-</middle_name>
                  <prefix>-</prefix>
                  <last_name>-</last_name>
                </person>
              </person_related_person>
            </related_persons>
            <re_relationship>
              <relationship_date_range>
                <valid_from>1900-01-01T00:00:00</valid_from>
              </relationship_date_range>
            </re_relationship>
            <additional_information>
              <additional_info>
                <info_subject>-</info_subject>
              </additional_info>
            </additional_information>
            <comments />
            <role>-</role>
          </director_id>
          <related_entities>
            <entity_related_entity>
              <entity_entity_relation />
              <entity>
                <name>-</name>
              </entity>
            </entity_related_entity>
          </related_entities>
          <incorporation_date>1900-01-01T00:00:00</incorporation_date>
        </entity_my_client>
        <foreign_currency>
          <foreign_currency_code>-</foreign_currency_code>
          <foreign_amount>0</foreign_amount>
          <foreign_exchange_rate>0</foreign_exchange_rate>
        </foreign_currency>
        <country>-</country>
      </party>
    </involved_parties>
  </transaction>
  <report_indicators>
    <indicator>-</indicator>
  </report_indicators>
  <additional_information>
    <additional_info>
      <info_subject>-</info_subject>
    </additional_info>
  </additional_information>
</report>
<report>
  <schema_version>5.1</schema_version>
  <rentity_id>11</rentity_id>
  <rentity_branch>Suame Branch</rentity_branch>
  <submission_code>E</submission_code>
  <report_code>CTR</report_code>
  <submission_date>2023-04-11T00:00:00</submission_date>
  <currency_code_local>GHC</currency_code_local>
  <reporting_user_code>Edith</reporting_user_code>
  <location>
    <address_type>-</address_type>
    <address>-</address>
    <additional_address_line1>-</additional_address_line1>
    <additional_address_line2>-</additional_address_line2>
    <city>KUMASI</city>
    <zip />
    <country_code>GH</country_code>
  </location>
  <transaction>
    <transactionnumber>20020906477</transactionnumber>
    <transaction_is_suspicious>false</transaction_is_suspicious>
    <agent_name>Seth Wiredu</agent_name>
    <transaction_location />
    <transaction_description>CASH DEPOSIT BY SETH WIREDU</transaction_description>
    <date_transaction>2023-04-11T00:00:00</date_transaction>
    <teller>KWARTEMAA SARFO</teller>
    <authorized>KWARTEMAA SARFO</authorized>
    <transaction_type_code>2023-04-11T00:00:00</transaction_type_code>
    <transmode_code>A</transmode_code>
    <transmode_comment>-</transmode_comment>
    <amount_local>21500.0000</amount_local>
    <transaction_status>C</transaction_status>
    <involved_parties>
      <party>
        <role>-</role>
        <entity_my_client>
          <name>ADEPA ADAMETEY VENTURES LIMITED</name>
          <commercial_name>-</commercial_name>
          <incorporation_legal_form>-</incorporation_legal_form>
          <incorporation_number>-</incorporation_number>
          <business>-</business>
          <entity_status>---</entity_status>
          <entity_status_date>1900-01-01T00:00:00</entity_status_date>
          <phones>
            <phone>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </phone>
          </phones>
          <addresses>
            <address>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>---</city>
              <zip />
              <country_code>GH</country_code>
            </address>
          </addresses>
          <network_devices>
            <network_device>
              <device_number />
              <ip_address>
                <ipv4>172.18.18.81</ipv4>
              </ip_address>
            </network_device>
          </network_devices>
          <email />
          <url />
          <incorporation_state />
          <incorporation_country_code>-</incorporation_country_code>
          <director_id>
            <gender>-</gender>
            <title />
            <first_name>-</first_name>
            <middle_name>-</middle_name>
            <prefix>-</prefix>
            <last_name>-</last_name>
            <birthdate>1900-01-01T00:00:00</birthdate>
            <birth_place />
            <country_of_birth>-</country_of_birth>
            <mothers_name />
            <alias />
            <full_name_frn>-</full_name_frn>
            <previous_names>
              <previous_name>
                <first_name>-</first_name>
                <last_name>-</last_name>
              </previous_name>
            </previous_names>
            <ssn />
            <passport_number>-</passport_number>
            <passport_country>-</passport_country>
            <id_number />
            <nationality1>-</nationality1>
            <nationality2>-</nationality2>
            <nationality3>-</nationality3>
            <residence>-</residence>
            <residence_since>1900-01-01T00:00:00</residence_since>
            <phones />
            <addresses />
            <network_devices>
              <network_device>
                <device_number />
                <ip_address>
                  <ipv4>172.18.18.81</ipv4>
                </ip_address>
              </network_device>
            </network_devices>
            <email>-----</email>
            <social_media>
              <social_account>
                <platform />
                <user_name />
              </social_account>
            </social_media>
            <occupation>-</occupation>
            <employer_name>-</employer_name>
            <employer_address_id>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>-</city>
              <zip />
              <country_code>GH</country_code>
            </employer_address_id>
            <employer_phone_id>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </employer_phone_id>
            <identifications>
              <identification>
                <type>-</type>
                <number />
                <issued_by />
                <issue_country>-</issue_country>
              </identification>
            </identifications>
            <deceased />
            <date_deceased>1900-01-01T00:00:00</date_deceased>
            <tax_number>-</tax_number>
            <tax_reg_number>-</tax_reg_number>
            <source_of_wealth />
            <peps>
              <pep>
                <pep_country>-</pep_country>
              </pep>
            </peps>
            <is_protected>true</is_protected>
            <sanctions>
              <sanction_list>
                <provider />
                <sanction_list_name />
              </sanction_list>
            </sanctions>
            <related_persons>
              <person_related_person>
                <person_person_relation>-</person_person_relation>
                <person>
                  <gender>-</gender>
                  <title />
                  <first_name>-</first_name>
                  <middle_name>-</middle_name>
                  <prefix>-</prefix>
                  <last_name>-</last_name>
                </person>
              </person_related_person>
            </related_persons>
            <re_relationship>
              <relationship_date_range>
                <valid_from>1900-01-01T00:00:00</valid_from>
              </relationship_date_range>
            </re_relationship>
            <additional_information>
              <additional_info>
                <info_subject>-</info_subject>
              </additional_info>
            </additional_information>
            <comments />
            <role>-</role>
          </director_id>
          <related_entities>
            <entity_related_entity>
              <entity_entity_relation />
              <entity>
                <name>-</name>
              </entity>
            </entity_related_entity>
          </related_entities>
          <incorporation_date>1900-01-01T00:00:00</incorporation_date>
        </entity_my_client>
        <foreign_currency>
          <foreign_currency_code>-</foreign_currency_code>
          <foreign_amount>0</foreign_amount>
          <foreign_exchange_rate>0</foreign_exchange_rate>
        </foreign_currency>
        <country>-</country>
      </party>
    </involved_parties>
  </transaction>
  <report_indicators>
    <indicator>-</indicator>
  </report_indicators>
  <additional_information>
    <additional_info>
      <info_subject>-</info_subject>
    </additional_info>
  </additional_information>
</report>
<report>
  <schema_version>5.1</schema_version>
  <rentity_id>12</rentity_id>
  <rentity_branch>Ho Branch</rentity_branch>
  <submission_code>E</submission_code>
  <report_code>CTR</report_code>
  <submission_date>2023-04-11T00:00:00</submission_date>
  <currency_code_local>GHC</currency_code_local>
  <reporting_user_code>Edith</reporting_user_code>
  <location>
    <address_type>-</address_type>
    <address>-</address>
    <additional_address_line1>-</additional_address_line1>
    <additional_address_line2>-</additional_address_line2>
    <city>ROAD</city>
    <zip />
    <country_code>GH</country_code>
  </location>
  <transaction>
    <transactionnumber>20020907140</transactionnumber>
    <transaction_is_suspicious>false</transaction_is_suspicious>
    <agent_name>Joycelyn Akuamoah</agent_name>
    <transaction_location />
    <transaction_description>CASH DEPOSITED BY BRIGHT</transaction_description>
    <date_transaction>2023-04-11T00:00:00</date_transaction>
    <teller>Freda Dagbey</teller>
    <authorized>Freda Dagbey</authorized>
    <transaction_type_code>2023-04-11T00:00:00</transaction_type_code>
    <transmode_code>A</transmode_code>
    <transmode_comment>-</transmode_comment>
    <amount_local>48000.0000</amount_local>
    <transaction_status>C</transaction_status>
    <involved_parties>
      <party>
        <role>-</role>
        <entity_my_client>
          <name>-</name>
          <commercial_name>-</commercial_name>
          <incorporation_legal_form>-</incorporation_legal_form>
          <incorporation_number>-</incorporation_number>
          <business>-</business>
          <entity_status>---</entity_status>
          <entity_status_date>1900-01-01T00:00:00</entity_status_date>
          <phones>
            <phone>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </phone>
          </phones>
          <addresses>
            <address>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>---</city>
              <zip />
              <country_code>GH</country_code>
            </address>
          </addresses>
          <network_devices>
            <network_device>
              <device_number />
              <ip_address>
                <ipv4>172.18.18.81</ipv4>
              </ip_address>
            </network_device>
          </network_devices>
          <email />
          <url />
          <incorporation_state />
          <incorporation_country_code>-</incorporation_country_code>
          <director_id>
            <gender>-</gender>
            <title />
            <first_name>-</first_name>
            <middle_name>-</middle_name>
            <prefix>-</prefix>
            <last_name>-</last_name>
            <birthdate>1900-01-01T00:00:00</birthdate>
            <birth_place />
            <country_of_birth>-</country_of_birth>
            <mothers_name />
            <alias />
            <full_name_frn>-</full_name_frn>
            <previous_names>
              <previous_name>
                <first_name>-</first_name>
                <last_name>-</last_name>
              </previous_name>
            </previous_names>
            <ssn />
            <passport_number>-</passport_number>
            <passport_country>-</passport_country>
            <id_number />
            <nationality1>-</nationality1>
            <nationality2>-</nationality2>
            <nationality3>-</nationality3>
            <residence>-</residence>
            <residence_since>1900-01-01T00:00:00</residence_since>
            <phones />
            <addresses />
            <network_devices>
              <network_device>
                <device_number />
                <ip_address>
                  <ipv4>172.18.18.81</ipv4>
                </ip_address>
              </network_device>
            </network_devices>
            <email>-----</email>
            <social_media>
              <social_account>
                <platform />
                <user_name />
              </social_account>
            </social_media>
            <occupation>-</occupation>
            <employer_name>-</employer_name>
            <employer_address_id>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>-</city>
              <zip />
              <country_code>GH</country_code>
            </employer_address_id>
            <employer_phone_id>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </employer_phone_id>
            <identifications>
              <identification>
                <type>-</type>
                <number />
                <issued_by />
                <issue_country>-</issue_country>
              </identification>
            </identifications>
            <deceased />
            <date_deceased>1900-01-01T00:00:00</date_deceased>
            <tax_number>-</tax_number>
            <tax_reg_number>-</tax_reg_number>
            <source_of_wealth />
            <peps>
              <pep>
                <pep_country>-</pep_country>
              </pep>
            </peps>
            <is_protected>true</is_protected>
            <sanctions>
              <sanction_list>
                <provider />
                <sanction_list_name />
              </sanction_list>
            </sanctions>
            <related_persons>
              <person_related_person>
                <person_person_relation>-</person_person_relation>
                <person>
                  <gender>-</gender>
                  <title />
                  <first_name>-</first_name>
                  <middle_name>-</middle_name>
                  <prefix>-</prefix>
                  <last_name>-</last_name>
                </person>
              </person_related_person>
            </related_persons>
            <re_relationship>
              <relationship_date_range>
                <valid_from>1900-01-01T00:00:00</valid_from>
              </relationship_date_range>
            </re_relationship>
            <additional_information>
              <additional_info>
                <info_subject>-</info_subject>
              </additional_info>
            </additional_information>
            <comments />
            <role>-</role>
          </director_id>
          <related_entities>
            <entity_related_entity>
              <entity_entity_relation />
              <entity>
                <name>-</name>
              </entity>
            </entity_related_entity>
          </related_entities>
          <incorporation_date>1900-01-01T00:00:00</incorporation_date>
        </entity_my_client>
        <foreign_currency>
          <foreign_currency_code>-</foreign_currency_code>
          <foreign_amount>0</foreign_amount>
          <foreign_exchange_rate>0</foreign_exchange_rate>
        </foreign_currency>
        <country>-</country>
      </party>
    </involved_parties>
  </transaction>
  <report_indicators>
    <indicator>-</indicator>
  </report_indicators>
  <additional_information>
    <additional_info>
      <info_subject>-</info_subject>
    </additional_info>
  </additional_information>
</report>
<report>
  <schema_version>5.1</schema_version>
  <rentity_id>13</rentity_id>
  <rentity_branch>Tamale Branch</rentity_branch>
  <submission_code>E</submission_code>
  <report_code>CTR</report_code>
  <submission_date>2023-04-11T00:00:00</submission_date>
  <currency_code_local>GHC</currency_code_local>
  <reporting_user_code>Edith</reporting_user_code>
  <location>
    <address_type>-</address_type>
    <address>-</address>
    <additional_address_line1>-</additional_address_line1>
    <additional_address_line2>-</additional_address_line2>
    <city>TAMALE</city>
    <zip />
    <country_code>GH</country_code>
  </location>
  <transaction>
    <transactionnumber>20020907545</transactionnumber>
    <transaction_is_suspicious>false</transaction_is_suspicious>
    <agent_name>Adam Sadia</agent_name>
    <transaction_location />
    <transaction_description>Cash dep. by Nathaniel</transaction_description>
    <date_transaction>2023-04-11T00:00:00</date_transaction>
    <teller>Josephine Osman</teller>
    <authorized>Josephine Osman</authorized>
    <transaction_type_code>2023-04-11T00:00:00</transaction_type_code>
    <transmode_code>A</transmode_code>
    <transmode_comment>-</transmode_comment>
    <amount_local>20000.0000</amount_local>
    <transaction_status>C</transaction_status>
    <involved_parties>
      <party>
        <role>-</role>
        <entity_my_client>
          <name>-</name>
          <commercial_name>-</commercial_name>
          <incorporation_legal_form>-</incorporation_legal_form>
          <incorporation_number>-</incorporation_number>
          <business>-</business>
          <entity_status>---</entity_status>
          <entity_status_date>1900-01-01T00:00:00</entity_status_date>
          <phones>
            <phone>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </phone>
          </phones>
          <addresses>
            <address>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>---</city>
              <zip />
              <country_code>GH</country_code>
            </address>
          </addresses>
          <network_devices>
            <network_device>
              <device_number />
              <ip_address>
                <ipv4>172.18.18.81</ipv4>
              </ip_address>
            </network_device>
          </network_devices>
          <email />
          <url />
          <incorporation_state />
          <incorporation_country_code>-</incorporation_country_code>
          <director_id>
            <gender>-</gender>
            <title />
            <first_name>-</first_name>
            <middle_name>-</middle_name>
            <prefix>-</prefix>
            <last_name>-</last_name>
            <birthdate>1900-01-01T00:00:00</birthdate>
            <birth_place />
            <country_of_birth>-</country_of_birth>
            <mothers_name />
            <alias />
            <full_name_frn>-</full_name_frn>
            <previous_names>
              <previous_name>
                <first_name>-</first_name>
                <last_name>-</last_name>
              </previous_name>
            </previous_names>
            <ssn />
            <passport_number>-</passport_number>
            <passport_country>-</passport_country>
            <id_number />
            <nationality1>-</nationality1>
            <nationality2>-</nationality2>
            <nationality3>-</nationality3>
            <residence>-</residence>
            <residence_since>1900-01-01T00:00:00</residence_since>
            <phones />
            <addresses />
            <network_devices>
              <network_device>
                <device_number />
                <ip_address>
                  <ipv4>172.18.18.81</ipv4>
                </ip_address>
              </network_device>
            </network_devices>
            <email>-----</email>
            <social_media>
              <social_account>
                <platform />
                <user_name />
              </social_account>
            </social_media>
            <occupation>-</occupation>
            <employer_name>-</employer_name>
            <employer_address_id>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>-</city>
              <zip />
              <country_code>GH</country_code>
            </employer_address_id>
            <employer_phone_id>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </employer_phone_id>
            <identifications>
              <identification>
                <type>-</type>
                <number />
                <issued_by />
                <issue_country>-</issue_country>
              </identification>
            </identifications>
            <deceased />
            <date_deceased>1900-01-01T00:00:00</date_deceased>
            <tax_number>-</tax_number>
            <tax_reg_number>-</tax_reg_number>
            <source_of_wealth />
            <peps>
              <pep>
                <pep_country>-</pep_country>
              </pep>
            </peps>
            <is_protected>true</is_protected>
            <sanctions>
              <sanction_list>
                <provider />
                <sanction_list_name />
              </sanction_list>
            </sanctions>
            <related_persons>
              <person_related_person>
                <person_person_relation>-</person_person_relation>
                <person>
                  <gender>-</gender>
                  <title />
                  <first_name>-</first_name>
                  <middle_name>-</middle_name>
                  <prefix>-</prefix>
                  <last_name>-</last_name>
                </person>
              </person_related_person>
            </related_persons>
            <re_relationship>
              <relationship_date_range>
                <valid_from>1900-01-01T00:00:00</valid_from>
              </relationship_date_range>
            </re_relationship>
            <additional_information>
              <additional_info>
                <info_subject>-</info_subject>
              </additional_info>
            </additional_information>
            <comments />
            <role>-</role>
          </director_id>
          <related_entities>
            <entity_related_entity>
              <entity_entity_relation />
              <entity>
                <name>-</name>
              </entity>
            </entity_related_entity>
          </related_entities>
          <incorporation_date>1900-01-01T00:00:00</incorporation_date>
        </entity_my_client>
        <foreign_currency>
          <foreign_currency_code>-</foreign_currency_code>
          <foreign_amount>0</foreign_amount>
          <foreign_exchange_rate>0</foreign_exchange_rate>
        </foreign_currency>
        <country>-</country>
      </party>
    </involved_parties>
  </transaction>
  <report_indicators>
    <indicator>-</indicator>
  </report_indicators>
  <additional_information>
    <additional_info>
      <info_subject>-</info_subject>
    </additional_info>
  </additional_information>
</report>
<report>
  <schema_version>5.1</schema_version>
  <rentity_id>14</rentity_id>
  <rentity_branch>Kumasi Retail Branch</rentity_branch>
  <submission_code>E</submission_code>
  <report_code>CTR</report_code>
  <submission_date>2023-04-11T00:00:00</submission_date>
  <currency_code_local>GHC</currency_code_local>
  <reporting_user_code>Edith</reporting_user_code>
  <location>
    <address_type>-</address_type>
    <address>-</address>
    <additional_address_line1>-</additional_address_line1>
    <additional_address_line2>-</additional_address_line2>
    <city>KUMASI</city>
    <zip />
    <country_code>GH</country_code>
  </location>
  <transaction>
    <transactionnumber>20020907470</transactionnumber>
    <transaction_is_suspicious>false</transaction_is_suspicious>
    <agent_name>Nana Siaw</agent_name>
    <transaction_location />
    <transaction_description>cash deposit by Nana Yaw Osei Berimah</transaction_description>
    <date_transaction>2023-04-11T00:00:00</date_transaction>
    <teller>Catherine mensah</teller>
    <authorized>Catherine mensah</authorized>
    <transaction_type_code>2023-04-11T00:00:00</transaction_type_code>
    <transmode_code>A</transmode_code>
    <transmode_comment>-</transmode_comment>
    <amount_local>34100.0000</amount_local>
    <transaction_status>C</transaction_status>
    <involved_parties>
      <party>
        <role>-</role>
        <entity_my_client>
          <name>Light Peach Company Limited</name>
          <commercial_name>-</commercial_name>
          <incorporation_legal_form>-</incorporation_legal_form>
          <incorporation_number>-</incorporation_number>
          <business>-</business>
          <entity_status>---</entity_status>
          <entity_status_date>1900-01-01T00:00:00</entity_status_date>
          <phones>
            <phone>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </phone>
          </phones>
          <addresses>
            <address>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>---</city>
              <zip />
              <country_code>GH</country_code>
            </address>
          </addresses>
          <network_devices>
            <network_device>
              <device_number />
              <ip_address>
                <ipv4>172.18.18.81</ipv4>
              </ip_address>
            </network_device>
          </network_devices>
          <email />
          <url />
          <incorporation_state />
          <incorporation_country_code>-</incorporation_country_code>
          <director_id>
            <gender>-</gender>
            <title />
            <first_name>-</first_name>
            <middle_name>-</middle_name>
            <prefix>-</prefix>
            <last_name>-</last_name>
            <birthdate>1900-01-01T00:00:00</birthdate>
            <birth_place />
            <country_of_birth>-</country_of_birth>
            <mothers_name />
            <alias />
            <full_name_frn>-</full_name_frn>
            <previous_names>
              <previous_name>
                <first_name>-</first_name>
                <last_name>-</last_name>
              </previous_name>
            </previous_names>
            <ssn />
            <passport_number>-</passport_number>
            <passport_country>-</passport_country>
            <id_number />
            <nationality1>-</nationality1>
            <nationality2>-</nationality2>
            <nationality3>-</nationality3>
            <residence>-</residence>
            <residence_since>1900-01-01T00:00:00</residence_since>
            <phones />
            <addresses />
            <network_devices>
              <network_device>
                <device_number />
                <ip_address>
                  <ipv4>172.18.18.81</ipv4>
                </ip_address>
              </network_device>
            </network_devices>
            <email>-----</email>
            <social_media>
              <social_account>
                <platform />
                <user_name />
              </social_account>
            </social_media>
            <occupation>-</occupation>
            <employer_name>-</employer_name>
            <employer_address_id>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>-</city>
              <zip />
              <country_code>GH</country_code>
            </employer_address_id>
            <employer_phone_id>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </employer_phone_id>
            <identifications>
              <identification>
                <type>-</type>
                <number />
                <issued_by />
                <issue_country>-</issue_country>
              </identification>
            </identifications>
            <deceased />
            <date_deceased>1900-01-01T00:00:00</date_deceased>
            <tax_number>-</tax_number>
            <tax_reg_number>-</tax_reg_number>
            <source_of_wealth />
            <peps>
              <pep>
                <pep_country>-</pep_country>
              </pep>
            </peps>
            <is_protected>true</is_protected>
            <sanctions>
              <sanction_list>
                <provider />
                <sanction_list_name />
              </sanction_list>
            </sanctions>
            <related_persons>
              <person_related_person>
                <person_person_relation>-</person_person_relation>
                <person>
                  <gender>-</gender>
                  <title />
                  <first_name>-</first_name>
                  <middle_name>-</middle_name>
                  <prefix>-</prefix>
                  <last_name>-</last_name>
                </person>
              </person_related_person>
            </related_persons>
            <re_relationship>
              <relationship_date_range>
                <valid_from>1900-01-01T00:00:00</valid_from>
              </relationship_date_range>
            </re_relationship>
            <additional_information>
              <additional_info>
                <info_subject>-</info_subject>
              </additional_info>
            </additional_information>
            <comments />
            <role>-</role>
          </director_id>
          <related_entities>
            <entity_related_entity>
              <entity_entity_relation />
              <entity>
                <name>-</name>
              </entity>
            </entity_related_entity>
          </related_entities>
          <incorporation_date>1900-01-01T00:00:00</incorporation_date>
        </entity_my_client>
        <foreign_currency>
          <foreign_currency_code>-</foreign_currency_code>
          <foreign_amount>0</foreign_amount>
          <foreign_exchange_rate>0</foreign_exchange_rate>
        </foreign_currency>
        <country>-</country>
      </party>
    </involved_parties>
  </transaction>
  <report_indicators>
    <indicator>-</indicator>
  </report_indicators>
  <additional_information>
    <additional_info>
      <info_subject>-</info_subject>
    </additional_info>
  </additional_information>
</report>
<report>
  <schema_version>5.1</schema_version>
  <rentity_id>15</rentity_id>
  <rentity_branch>Suame Branch</rentity_branch>
  <submission_code>E</submission_code>
  <report_code>CTR</report_code>
  <submission_date>2023-04-11T00:00:00</submission_date>
  <currency_code_local>GHC</currency_code_local>
  <reporting_user_code>Edith</reporting_user_code>
  <location>
    <address_type>-</address_type>
    <address>-</address>
    <additional_address_line1>-</additional_address_line1>
    <additional_address_line2>-</additional_address_line2>
    <city>ASAFO-KUMASI</city>
    <zip />
    <country_code>GH</country_code>
  </location>
  <transaction>
    <transactionnumber>20020907717</transactionnumber>
    <transaction_is_suspicious>false</transaction_is_suspicious>
    <agent_name>Seth Wiredu</agent_name>
    <transaction_location />
    <transaction_description>CASH DEPOSIT BY SETH WIREDU</transaction_description>
    <date_transaction>2023-04-11T00:00:00</date_transaction>
    <teller>KWARTEMAA SARFO</teller>
    <authorized>KWARTEMAA SARFO</authorized>
    <transaction_type_code>2023-04-11T00:00:00</transaction_type_code>
    <transmode_code>A</transmode_code>
    <transmode_comment>-</transmode_comment>
    <amount_local>100000.0000</amount_local>
    <transaction_status>C</transaction_status>
    <involved_parties>
      <party>
        <role>-</role>
        <entity_my_client>
          <name>FROZEN PARADISE LIMITED</name>
          <commercial_name>-</commercial_name>
          <incorporation_legal_form>-</incorporation_legal_form>
          <incorporation_number>-</incorporation_number>
          <business>-</business>
          <entity_status>---</entity_status>
          <entity_status_date>1900-01-01T00:00:00</entity_status_date>
          <phones>
            <phone>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </phone>
          </phones>
          <addresses>
            <address>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>---</city>
              <zip />
              <country_code>GH</country_code>
            </address>
          </addresses>
          <network_devices>
            <network_device>
              <device_number />
              <ip_address>
                <ipv4>172.18.18.81</ipv4>
              </ip_address>
            </network_device>
          </network_devices>
          <email />
          <url />
          <incorporation_state />
          <incorporation_country_code>-</incorporation_country_code>
          <director_id>
            <gender>-</gender>
            <title />
            <first_name>-</first_name>
            <middle_name>-</middle_name>
            <prefix>-</prefix>
            <last_name>-</last_name>
            <birthdate>1900-01-01T00:00:00</birthdate>
            <birth_place />
            <country_of_birth>-</country_of_birth>
            <mothers_name />
            <alias />
            <full_name_frn>-</full_name_frn>
            <previous_names>
              <previous_name>
                <first_name>-</first_name>
                <last_name>-</last_name>
              </previous_name>
            </previous_names>
            <ssn />
            <passport_number>-</passport_number>
            <passport_country>-</passport_country>
            <id_number />
            <nationality1>-</nationality1>
            <nationality2>-</nationality2>
            <nationality3>-</nationality3>
            <residence>-</residence>
            <residence_since>1900-01-01T00:00:00</residence_since>
            <phones />
            <addresses />
            <network_devices>
              <network_device>
                <device_number />
                <ip_address>
                  <ipv4>172.18.18.81</ipv4>
                </ip_address>
              </network_device>
            </network_devices>
            <email>-----</email>
            <social_media>
              <social_account>
                <platform />
                <user_name />
              </social_account>
            </social_media>
            <occupation>-</occupation>
            <employer_name>-</employer_name>
            <employer_address_id>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>-</city>
              <zip />
              <country_code>GH</country_code>
            </employer_address_id>
            <employer_phone_id>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </employer_phone_id>
            <identifications>
              <identification>
                <type>-</type>
                <number />
                <issued_by />
                <issue_country>-</issue_country>
              </identification>
            </identifications>
            <deceased />
            <date_deceased>1900-01-01T00:00:00</date_deceased>
            <tax_number>-</tax_number>
            <tax_reg_number>-</tax_reg_number>
            <source_of_wealth />
            <peps>
              <pep>
                <pep_country>-</pep_country>
              </pep>
            </peps>
            <is_protected>true</is_protected>
            <sanctions>
              <sanction_list>
                <provider />
                <sanction_list_name />
              </sanction_list>
            </sanctions>
            <related_persons>
              <person_related_person>
                <person_person_relation>-</person_person_relation>
                <person>
                  <gender>-</gender>
                  <title />
                  <first_name>-</first_name>
                  <middle_name>-</middle_name>
                  <prefix>-</prefix>
                  <last_name>-</last_name>
                </person>
              </person_related_person>
            </related_persons>
            <re_relationship>
              <relationship_date_range>
                <valid_from>1900-01-01T00:00:00</valid_from>
              </relationship_date_range>
            </re_relationship>
            <additional_information>
              <additional_info>
                <info_subject>-</info_subject>
              </additional_info>
            </additional_information>
            <comments />
            <role>-</role>
          </director_id>
          <related_entities>
            <entity_related_entity>
              <entity_entity_relation />
              <entity>
                <name>-</name>
              </entity>
            </entity_related_entity>
          </related_entities>
          <incorporation_date>1900-01-01T00:00:00</incorporation_date>
        </entity_my_client>
        <foreign_currency>
          <foreign_currency_code>-</foreign_currency_code>
          <foreign_amount>0</foreign_amount>
          <foreign_exchange_rate>0</foreign_exchange_rate>
        </foreign_currency>
        <country>-</country>
      </party>
    </involved_parties>
  </transaction>
  <report_indicators>
    <indicator>-</indicator>
  </report_indicators>
  <additional_information>
    <additional_info>
      <info_subject>-</info_subject>
    </additional_info>
  </additional_information>
</report>
<report>
  <schema_version>5.1</schema_version>
  <rentity_id>16</rentity_id>
  <rentity_branch>Ho Branch</rentity_branch>
  <submission_code>E</submission_code>
  <report_code>CTR</report_code>
  <submission_date>2023-04-11T00:00:00</submission_date>
  <currency_code_local>GHC</currency_code_local>
  <reporting_user_code>Edith</reporting_user_code>
  <location>
    <address_type>-</address_type>
    <address>-</address>
    <additional_address_line1>-</additional_address_line1>
    <additional_address_line2>-</additional_address_line2>
    <city>HO</city>
    <zip />
    <country_code>GH</country_code>
  </location>
  <transaction>
    <transactionnumber>20020908457</transactionnumber>
    <transaction_is_suspicious>false</transaction_is_suspicious>
    <agent_name>Charlotte Gatsey</agent_name>
    <transaction_location />
    <transaction_description>CASH DEPOSITED BY EMMANUEL MENSAH</transaction_description>
    <date_transaction>2023-04-11T00:00:00</date_transaction>
    <teller>Charlotte Gatsey</teller>
    <authorized>Charlotte Gatsey</authorized>
    <transaction_type_code>2023-04-11T00:00:00</transaction_type_code>
    <transmode_code>A</transmode_code>
    <transmode_comment>-</transmode_comment>
    <amount_local>24500.0000</amount_local>
    <transaction_status>C</transaction_status>
    <involved_parties>
      <party>
        <role>-</role>
        <entity_my_client>
          <name>-</name>
          <commercial_name>-</commercial_name>
          <incorporation_legal_form>-</incorporation_legal_form>
          <incorporation_number>-</incorporation_number>
          <business>-</business>
          <entity_status>---</entity_status>
          <entity_status_date>1900-01-01T00:00:00</entity_status_date>
          <phones>
            <phone>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </phone>
          </phones>
          <addresses>
            <address>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>---</city>
              <zip />
              <country_code>GH</country_code>
            </address>
          </addresses>
          <network_devices>
            <network_device>
              <device_number />
              <ip_address>
                <ipv4>172.18.18.81</ipv4>
              </ip_address>
            </network_device>
          </network_devices>
          <email />
          <url />
          <incorporation_state />
          <incorporation_country_code>-</incorporation_country_code>
          <director_id>
            <gender>-</gender>
            <title />
            <first_name>-</first_name>
            <middle_name>-</middle_name>
            <prefix>-</prefix>
            <last_name>-</last_name>
            <birthdate>1900-01-01T00:00:00</birthdate>
            <birth_place />
            <country_of_birth>-</country_of_birth>
            <mothers_name />
            <alias />
            <full_name_frn>-</full_name_frn>
            <previous_names>
              <previous_name>
                <first_name>-</first_name>
                <last_name>-</last_name>
              </previous_name>
            </previous_names>
            <ssn />
            <passport_number>-</passport_number>
            <passport_country>-</passport_country>
            <id_number />
            <nationality1>-</nationality1>
            <nationality2>-</nationality2>
            <nationality3>-</nationality3>
            <residence>-</residence>
            <residence_since>1900-01-01T00:00:00</residence_since>
            <phones />
            <addresses />
            <network_devices>
              <network_device>
                <device_number />
                <ip_address>
                  <ipv4>172.18.18.81</ipv4>
                </ip_address>
              </network_device>
            </network_devices>
            <email>-----</email>
            <social_media>
              <social_account>
                <platform />
                <user_name />
              </social_account>
            </social_media>
            <occupation>-</occupation>
            <employer_name>-</employer_name>
            <employer_address_id>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>-</city>
              <zip />
              <country_code>GH</country_code>
            </employer_address_id>
            <employer_phone_id>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </employer_phone_id>
            <identifications>
              <identification>
                <type>-</type>
                <number />
                <issued_by />
                <issue_country>-</issue_country>
              </identification>
            </identifications>
            <deceased />
            <date_deceased>1900-01-01T00:00:00</date_deceased>
            <tax_number>-</tax_number>
            <tax_reg_number>-</tax_reg_number>
            <source_of_wealth />
            <peps>
              <pep>
                <pep_country>-</pep_country>
              </pep>
            </peps>
            <is_protected>true</is_protected>
            <sanctions>
              <sanction_list>
                <provider />
                <sanction_list_name />
              </sanction_list>
            </sanctions>
            <related_persons>
              <person_related_person>
                <person_person_relation>-</person_person_relation>
                <person>
                  <gender>-</gender>
                  <title />
                  <first_name>-</first_name>
                  <middle_name>-</middle_name>
                  <prefix>-</prefix>
                  <last_name>-</last_name>
                </person>
              </person_related_person>
            </related_persons>
            <re_relationship>
              <relationship_date_range>
                <valid_from>1900-01-01T00:00:00</valid_from>
              </relationship_date_range>
            </re_relationship>
            <additional_information>
              <additional_info>
                <info_subject>-</info_subject>
              </additional_info>
            </additional_information>
            <comments />
            <role>-</role>
          </director_id>
          <related_entities>
            <entity_related_entity>
              <entity_entity_relation />
              <entity>
                <name>-</name>
              </entity>
            </entity_related_entity>
          </related_entities>
          <incorporation_date>1900-01-01T00:00:00</incorporation_date>
        </entity_my_client>
        <foreign_currency>
          <foreign_currency_code>-</foreign_currency_code>
          <foreign_amount>0</foreign_amount>
          <foreign_exchange_rate>0</foreign_exchange_rate>
        </foreign_currency>
        <country>-</country>
      </party>
    </involved_parties>
  </transaction>
  <report_indicators>
    <indicator>-</indicator>
  </report_indicators>
  <additional_information>
    <additional_info>
      <info_subject>-</info_subject>
    </additional_info>
  </additional_information>
</report>
<report>
  <schema_version>5.1</schema_version>
  <rentity_id>17</rentity_id>
  <rentity_branch>Service Center Branch</rentity_branch>
  <submission_code>E</submission_code>
  <report_code>CTR</report_code>
  <submission_date>2023-04-11T00:00:00</submission_date>
  <currency_code_local>GHC</currency_code_local>
  <reporting_user_code>Edith</reporting_user_code>
  <location>
    <address_type>-</address_type>
    <address>-</address>
    <additional_address_line1>-</additional_address_line1>
    <additional_address_line2>-</additional_address_line2>
    <city>WEST RIDGE</city>
    <zip />
    <country_code>GH</country_code>
  </location>
  <transaction>
    <transactionnumber>20020907338</transactionnumber>
    <transaction_is_suspicious>false</transaction_is_suspicious>
    <agent_name>Service Walkin</agent_name>
    <transaction_location />
    <transaction_description>CASH DEP BY THOMAS OSEI</transaction_description>
    <date_transaction>2023-04-11T00:00:00</date_transaction>
    <teller>Rebecca Yegbey</teller>
    <authorized>Rebecca Yegbey</authorized>
    <transaction_type_code>2023-04-11T00:00:00</transaction_type_code>
    <transmode_code>A</transmode_code>
    <transmode_comment>-</transmode_comment>
    <amount_local>150000.0000</amount_local>
    <transaction_status>C</transaction_status>
    <involved_parties>
      <party>
        <role>-</role>
        <entity_my_client>
          <name>PHOEBECHEM KWAME ENTERPRISE</name>
          <commercial_name>-</commercial_name>
          <incorporation_legal_form>-</incorporation_legal_form>
          <incorporation_number>-</incorporation_number>
          <business>-</business>
          <entity_status>---</entity_status>
          <entity_status_date>1900-01-01T00:00:00</entity_status_date>
          <phones>
            <phone>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </phone>
          </phones>
          <addresses>
            <address>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>---</city>
              <zip />
              <country_code>GH</country_code>
            </address>
          </addresses>
          <network_devices>
            <network_device>
              <device_number />
              <ip_address>
                <ipv4>172.18.18.81</ipv4>
              </ip_address>
            </network_device>
          </network_devices>
          <email />
          <url />
          <incorporation_state />
          <incorporation_country_code>-</incorporation_country_code>
          <director_id>
            <gender>-</gender>
            <title />
            <first_name>-</first_name>
            <middle_name>-</middle_name>
            <prefix>-</prefix>
            <last_name>-</last_name>
            <birthdate>1900-01-01T00:00:00</birthdate>
            <birth_place />
            <country_of_birth>-</country_of_birth>
            <mothers_name />
            <alias />
            <full_name_frn>-</full_name_frn>
            <previous_names>
              <previous_name>
                <first_name>-</first_name>
                <last_name>-</last_name>
              </previous_name>
            </previous_names>
            <ssn />
            <passport_number>-</passport_number>
            <passport_country>-</passport_country>
            <id_number />
            <nationality1>-</nationality1>
            <nationality2>-</nationality2>
            <nationality3>-</nationality3>
            <residence>-</residence>
            <residence_since>1900-01-01T00:00:00</residence_since>
            <phones />
            <addresses />
            <network_devices>
              <network_device>
                <device_number />
                <ip_address>
                  <ipv4>172.18.18.81</ipv4>
                </ip_address>
              </network_device>
            </network_devices>
            <email>-----</email>
            <social_media>
              <social_account>
                <platform />
                <user_name />
              </social_account>
            </social_media>
            <occupation>-</occupation>
            <employer_name>-</employer_name>
            <employer_address_id>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>-</city>
              <zip />
              <country_code>GH</country_code>
            </employer_address_id>
            <employer_phone_id>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </employer_phone_id>
            <identifications>
              <identification>
                <type>-</type>
                <number />
                <issued_by />
                <issue_country>-</issue_country>
              </identification>
            </identifications>
            <deceased />
            <date_deceased>1900-01-01T00:00:00</date_deceased>
            <tax_number>-</tax_number>
            <tax_reg_number>-</tax_reg_number>
            <source_of_wealth />
            <peps>
              <pep>
                <pep_country>-</pep_country>
              </pep>
            </peps>
            <is_protected>true</is_protected>
            <sanctions>
              <sanction_list>
                <provider />
                <sanction_list_name />
              </sanction_list>
            </sanctions>
            <related_persons>
              <person_related_person>
                <person_person_relation>-</person_person_relation>
                <person>
                  <gender>-</gender>
                  <title />
                  <first_name>-</first_name>
                  <middle_name>-</middle_name>
                  <prefix>-</prefix>
                  <last_name>-</last_name>
                </person>
              </person_related_person>
            </related_persons>
            <re_relationship>
              <relationship_date_range>
                <valid_from>1900-01-01T00:00:00</valid_from>
              </relationship_date_range>
            </re_relationship>
            <additional_information>
              <additional_info>
                <info_subject>-</info_subject>
              </additional_info>
            </additional_information>
            <comments />
            <role>-</role>
          </director_id>
          <related_entities>
            <entity_related_entity>
              <entity_entity_relation />
              <entity>
                <name>-</name>
              </entity>
            </entity_related_entity>
          </related_entities>
          <incorporation_date>1900-01-01T00:00:00</incorporation_date>
        </entity_my_client>
        <foreign_currency>
          <foreign_currency_code>-</foreign_currency_code>
          <foreign_amount>0</foreign_amount>
          <foreign_exchange_rate>0</foreign_exchange_rate>
        </foreign_currency>
        <country>-</country>
      </party>
    </involved_parties>
  </transaction>
  <report_indicators>
    <indicator>-</indicator>
  </report_indicators>
  <additional_information>
    <additional_info>
      <info_subject>-</info_subject>
    </additional_info>
  </additional_information>
</report>
<report>
  <schema_version>5.1</schema_version>
  <rentity_id>18</rentity_id>
  <rentity_branch>Kumasi Retail Branch</rentity_branch>
  <submission_code>E</submission_code>
  <report_code>CTR</report_code>
  <submission_date>2023-04-11T00:00:00</submission_date>
  <currency_code_local>GHC</currency_code_local>
  <reporting_user_code>Edith</reporting_user_code>
  <location>
    <address_type>-</address_type>
    <address>-</address>
    <additional_address_line1>-</additional_address_line1>
    <additional_address_line2>-</additional_address_line2>
    <city>KUMASI</city>
    <zip />
    <country_code>GH</country_code>
  </location>
  <transaction>
    <transactionnumber>20020908554</transactionnumber>
    <transaction_is_suspicious>false</transaction_is_suspicious>
    <agent_name>Samuel Twumasi-Ankrah</agent_name>
    <transaction_location />
    <transaction_description>cash deposit by Lovia Opoku Agyemang</transaction_description>
    <date_transaction>2023-04-11T00:00:00</date_transaction>
    <teller>Francis Delwmine</teller>
    <authorized>Francis Delwmine</authorized>
    <transaction_type_code>2023-04-11T00:00:00</transaction_type_code>
    <transmode_code>A</transmode_code>
    <transmode_comment>-</transmode_comment>
    <amount_local>30000.0000</amount_local>
    <transaction_status>C</transaction_status>
    <involved_parties>
      <party>
        <role>-</role>
        <entity_my_client>
          <name>ROYAL OSAMP VENTURES</name>
          <commercial_name>-</commercial_name>
          <incorporation_legal_form>-</incorporation_legal_form>
          <incorporation_number>-</incorporation_number>
          <business>-</business>
          <entity_status>---</entity_status>
          <entity_status_date>1900-01-01T00:00:00</entity_status_date>
          <phones>
            <phone>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </phone>
          </phones>
          <addresses>
            <address>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>---</city>
              <zip />
              <country_code>GH</country_code>
            </address>
          </addresses>
          <network_devices>
            <network_device>
              <device_number />
              <ip_address>
                <ipv4>172.18.18.81</ipv4>
              </ip_address>
            </network_device>
          </network_devices>
          <email />
          <url />
          <incorporation_state />
          <incorporation_country_code>-</incorporation_country_code>
          <director_id>
            <gender>-</gender>
            <title />
            <first_name>-</first_name>
            <middle_name>-</middle_name>
            <prefix>-</prefix>
            <last_name>-</last_name>
            <birthdate>1900-01-01T00:00:00</birthdate>
            <birth_place />
            <country_of_birth>-</country_of_birth>
            <mothers_name />
            <alias />
            <full_name_frn>-</full_name_frn>
            <previous_names>
              <previous_name>
                <first_name>-</first_name>
                <last_name>-</last_name>
              </previous_name>
            </previous_names>
            <ssn />
            <passport_number>-</passport_number>
            <passport_country>-</passport_country>
            <id_number />
            <nationality1>-</nationality1>
            <nationality2>-</nationality2>
            <nationality3>-</nationality3>
            <residence>-</residence>
            <residence_since>1900-01-01T00:00:00</residence_since>
            <phones />
            <addresses />
            <network_devices>
              <network_device>
                <device_number />
                <ip_address>
                  <ipv4>172.18.18.81</ipv4>
                </ip_address>
              </network_device>
            </network_devices>
            <email>-----</email>
            <social_media>
              <social_account>
                <platform />
                <user_name />
              </social_account>
            </social_media>
            <occupation>-</occupation>
            <employer_name>-</employer_name>
            <employer_address_id>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>-</city>
              <zip />
              <country_code>GH</country_code>
            </employer_address_id>
            <employer_phone_id>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </employer_phone_id>
            <identifications>
              <identification>
                <type>-</type>
                <number />
                <issued_by />
                <issue_country>-</issue_country>
              </identification>
            </identifications>
            <deceased />
            <date_deceased>1900-01-01T00:00:00</date_deceased>
            <tax_number>-</tax_number>
            <tax_reg_number>-</tax_reg_number>
            <source_of_wealth />
            <peps>
              <pep>
                <pep_country>-</pep_country>
              </pep>
            </peps>
            <is_protected>true</is_protected>
            <sanctions>
              <sanction_list>
                <provider />
                <sanction_list_name />
              </sanction_list>
            </sanctions>
            <related_persons>
              <person_related_person>
                <person_person_relation>-</person_person_relation>
                <person>
                  <gender>-</gender>
                  <title />
                  <first_name>-</first_name>
                  <middle_name>-</middle_name>
                  <prefix>-</prefix>
                  <last_name>-</last_name>
                </person>
              </person_related_person>
            </related_persons>
            <re_relationship>
              <relationship_date_range>
                <valid_from>1900-01-01T00:00:00</valid_from>
              </relationship_date_range>
            </re_relationship>
            <additional_information>
              <additional_info>
                <info_subject>-</info_subject>
              </additional_info>
            </additional_information>
            <comments />
            <role>-</role>
          </director_id>
          <related_entities>
            <entity_related_entity>
              <entity_entity_relation />
              <entity>
                <name>-</name>
              </entity>
            </entity_related_entity>
          </related_entities>
          <incorporation_date>1900-01-01T00:00:00</incorporation_date>
        </entity_my_client>
        <foreign_currency>
          <foreign_currency_code>-</foreign_currency_code>
          <foreign_amount>0</foreign_amount>
          <foreign_exchange_rate>0</foreign_exchange_rate>
        </foreign_currency>
        <country>-</country>
      </party>
    </involved_parties>
  </transaction>
  <report_indicators>
    <indicator>-</indicator>
  </report_indicators>
  <additional_information>
    <additional_info>
      <info_subject>-</info_subject>
    </additional_info>
  </additional_information>
</report>
<report>
  <schema_version>5.1</schema_version>
  <rentity_id>19</rentity_id>
  <rentity_branch>Cape Coast Branch</rentity_branch>
  <submission_code>E</submission_code>
  <report_code>CTR</report_code>
  <submission_date>2023-04-11T00:00:00</submission_date>
  <currency_code_local>GHC</currency_code_local>
  <reporting_user_code>Edith</reporting_user_code>
  <location>
    <address_type>-</address_type>
    <address>-</address>
    <additional_address_line1>-</additional_address_line1>
    <additional_address_line2>-</additional_address_line2>
    <city>ELMINA</city>
    <zip />
    <country_code>GH</country_code>
  </location>
  <transaction>
    <transactionnumber>20020906471</transactionnumber>
    <transaction_is_suspicious>false</transaction_is_suspicious>
    <agent_name>Michael Osom</agent_name>
    <transaction_location />
    <transaction_description>DEPOSITED BY EDWINA NELSON</transaction_description>
    <date_transaction>2023-04-11T00:00:00</date_transaction>
    <teller>Stephen Mensah</teller>
    <authorized>Stephen Mensah</authorized>
    <transaction_type_code>2023-04-11T00:00:00</transaction_type_code>
    <transmode_code>A</transmode_code>
    <transmode_comment>-</transmode_comment>
    <amount_local>37800.0000</amount_local>
    <transaction_status>C</transaction_status>
    <involved_parties>
      <party>
        <role>-</role>
        <entity_my_client>
          <name>Quayson</name>
          <commercial_name>-</commercial_name>
          <incorporation_legal_form>-</incorporation_legal_form>
          <incorporation_number>-</incorporation_number>
          <business>-</business>
          <entity_status>---</entity_status>
          <entity_status_date>1900-01-01T00:00:00</entity_status_date>
          <phones>
            <phone>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </phone>
          </phones>
          <addresses>
            <address>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>---</city>
              <zip />
              <country_code>GH</country_code>
            </address>
          </addresses>
          <network_devices>
            <network_device>
              <device_number />
              <ip_address>
                <ipv4>172.18.18.81</ipv4>
              </ip_address>
            </network_device>
          </network_devices>
          <email />
          <url />
          <incorporation_state />
          <incorporation_country_code>-</incorporation_country_code>
          <director_id>
            <gender>-</gender>
            <title />
            <first_name>-</first_name>
            <middle_name>-</middle_name>
            <prefix>-</prefix>
            <last_name>-</last_name>
            <birthdate>1900-01-01T00:00:00</birthdate>
            <birth_place />
            <country_of_birth>-</country_of_birth>
            <mothers_name />
            <alias />
            <full_name_frn>-</full_name_frn>
            <previous_names>
              <previous_name>
                <first_name>-</first_name>
                <last_name>-</last_name>
              </previous_name>
            </previous_names>
            <ssn />
            <passport_number>-</passport_number>
            <passport_country>-</passport_country>
            <id_number />
            <nationality1>-</nationality1>
            <nationality2>-</nationality2>
            <nationality3>-</nationality3>
            <residence>-</residence>
            <residence_since>1900-01-01T00:00:00</residence_since>
            <phones />
            <addresses />
            <network_devices>
              <network_device>
                <device_number />
                <ip_address>
                  <ipv4>172.18.18.81</ipv4>
                </ip_address>
              </network_device>
            </network_devices>
            <email>-----</email>
            <social_media>
              <social_account>
                <platform />
                <user_name />
              </social_account>
            </social_media>
            <occupation>-</occupation>
            <employer_name>-</employer_name>
            <employer_address_id>
              <address_type>-</address_type>
              <address>---</address>
              <additional_address_line1>-</additional_address_line1>
              <additional_address_line2>-</additional_address_line2>
              <city>-</city>
              <zip />
              <country_code>GH</country_code>
            </employer_address_id>
            <employer_phone_id>
              <tph_contact_type>-</tph_contact_type>
              <tph_communication_type>-</tph_communication_type>
              <tph_country_prefix>-</tph_country_prefix>
              <tph_number>-</tph_number>
            </employer_phone_id>
            <identifications>
              <identification>
                <type>-</type>
                <number />
                <issued_by />
                <issue_country>-</issue_country>
              </identification>
            </identifications>
            <deceased />
            <date_deceased>1900-01-01T00:00:00</date_deceased>
            <tax_number>-</tax_number>
            <tax_reg_number>-</tax_reg_number>
            <source_of_wealth />
            <peps>
              <pep>
                <pep_country>-</pep_country>
              </pep>
            </peps>
            <is_protected>true</is_protected>
            <sanctions>
              <sanction_list>
                <provider />
                <sanction_list_name />
              </sanction_list>
            </sanctions>
            <related_persons>
              <person_related_person>
                <person_person_relation>-</person_person_relation>
                <person>
                  <gender>-</gender>
                  <title />
                  <first_name>-</first_name>
                  <middle_name>-</middle_name>
                  <prefix>-</prefix>
                  <last_name>-</last_name>
                </person>
              </person_related_person>
            </related_persons>
            <re_relationship>
              <relationship_date_range>
                <valid_from>1900-01-01T00:00:00</valid_from>
              </relationship_date_range>
            </re_relationship>
            <additional_information>
              <additional_info>
                <info_subject>-</info_subject>
              </additional_info>
            </additional_information>
            <comments />
            <role>-</role>
          </director_id>
          <related_entities>
            <entity_related_entity>
              <entity_entity_relation />
              <entity>
                <name>-</name>
              </entity>
            </entity_related_entity>
          </related_entities>
          <incorporation_date>1900-01-01T00:00:00</incorporation_date>
        </entity_my_client>
        <foreign_currency>
          <foreign_currency_code>-</foreign_currency_code>
          <foreign_amount>0</foreign_amount>
          <foreign_exchange_rate>0</foreign_exchange_rate>
        </foreign_currency>
        <country>-</country>
      </party>
    </involved_parties>
  </transaction>
  <report_indicators>
    <indicator>-</indicator>
  </report_indicators>
  <additional_information>
    <additional_info>
      <info_subject>-</info_subject>
    </additional_info>
  </additional_information>
</report>
';

BEGIN TRY
  SELECT @TYPED_XML = @UNTYPED_XML;
  SELECT MSG = N'PASSED SCHEMA VALIDATION';
END TRY
BEGIN CATCH
  SELECT MSG=ERROR_MESSAGE();
END CATCH