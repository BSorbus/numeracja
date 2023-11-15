module PlicbdModule

  def self.load_data_from_plicbd
    puts '----------------------------------------------------------------'
    puts 'RUN plicbd_whenever...'
    start_run = Time.current

    load_csv_from_plicbd

    puts "START: #{start_run}  END: #{Time.current}"
    puts '----------------------------------------------------------------'
  end

  def self.load_csv_from_plicbd
    file = %x{
        STORE_DIR="/webapps/www/numeracja/current/db/seeds"
        PLI_CERT_DIR="/webapps/www/certyfikaty_plicbd"
        DATE_STR=$(date +"%Y%m%d")
        FILE_NAME="TabliceNumeracjiUKE_$DATE_STR.zip"
        DESTINATION_FILE="$STORE_DIR/$FILE_NAME"
        LOG_FILE="/webapps/www/numeracja/current/log/plicbd.log"

        DATE_TIME_START=$(date +"%Y.%m.%d %H:%M:%S")
        echo "" >> $LOG_FILE
        echo "$DATE_TIME_START - Start download $FILE_NAME" >> $LOG_FILE

        cd $STORE_DIR
        curl --cacert $PLI_CERT_DIR/rootcapli.cer --key $PLI_CERT_DIR/ukepli.key --cert $PLI_CERT_DIR/ukepli.cer https://sou2.plicbd.gov.pl/TabliceNumeracjiUKE/$FILE_NAME --output $DESTINATION_FILE --silent

        rm AUS.csv >> $LOG_FILE
        rm HESC.csv >> $LOG_FILE
        rm IN.csv >> $LOG_FILE
        rm ISPC.csv >> $LOG_FILE
        rm M2M.csv >> $LOG_FILE
        rm MNC.csv >> $LOG_FILE
        rm NDS.csv >> $LOG_FILE
        rm NDSI.csv >> $LOG_FILE
        rm NRNP.csv >> $LOG_FILE
        rm NSPC.csv >> $LOG_FILE
        rm PLMN.csv >> $LOG_FILE
        rm PSTN.csv >> $LOG_FILE
        rm VOIP.csv >> $LOG_FILE
        unzip $DESTINATION_FILE >> $LOG_FILE

        DATE_TIME_END=$(date +"%Y.%m.%d %H:%M:%S")
        echo "$DATE_TIME_END - done" >> $LOG_FILE
    }

    AusTable.load_data_from_csv_file
    HescTable.load_data_from_csv_file
    NdinTable.load_data_from_csv_file
    IspcTable.load_data_from_csv_file
    MncTable.load_data_from_csv_file
    NdsTable.load_data_from_csv_file
    NdsiTable.load_data_from_csv_file
    NrnpTable.load_data_from_csv_file
    NspcTable.load_data_from_csv_file
    PlmnTable.load_data_from_csv_file
    PstnTable.load_data_from_csv_file
    VoipTable.load_data_from_csv_file
    M2mTable.load_data_from_csv_file

  end

end
