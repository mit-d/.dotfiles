ipsum() {
    # Default values
    arg_w="3,20"
    arg_s="2,5"
    arg_p="1"
    arg_i=""
    no_start=0
    ipsum_dir="${HOME}/.local/share/ipsum"

    # Manual check for --help/ -h before getopts
    for arg in "$@"; do
        if [ "$arg" = "--help" ] || [ "$arg" = "-h" ]; then
            printf "Usage: ipsum [options]\n\n"
            printf "Options:\n"
            printf "  -w MIN[,MAX]  Words per sentence (default: 3,20)\n"
            printf "  -s MIN[,MAX]  Sentences per paragraph (default: 2,5)\n"
            printf "  -p NUM        Number of paragraphs (default: 1)\n"
            printf "  -i NAME|PATH  Ipsum file name or path (default: ipsum.txt in ~/.local/share/ipsum)\n"
            printf "  -n            Don't start with 'Lorem ipsum...'\n"
            return 0
        fi
    done

    OPTIND=1
    while getopts "w:s:p:i:n" opt; do
        case "$opt" in
            w) arg_w=$OPTARG ;;
            s) arg_s=$OPTARG ;;
            p) arg_p=$OPTARG ;;
            i) arg_i=$OPTARG ;;
            n) no_start=1 ;;
            *) return 1 ;;
        esac
    done

    # Resolve ipsum file path
    ipsum_file=""
    if [ -z "$arg_i" ]; then
        # Default case: check for ipsum.txt in the ipsum_dir
        if [ -f "${ipsum_dir}/ipsum.txt" ]; then
            ipsum_file="${ipsum_dir}/ipsum.txt"
        fi
    elif [ -f "$arg_i" ]; then
        # Real path provided
        ipsum_file="$arg_i"
    elif [ -f "${ipsum_dir}/${arg_i}" ]; then
        # Name provided matches a file in ipsum_dir (e.g., "test.txt")
        ipsum_file="${ipsum_dir}/${arg_i}"
    elif [ -f "${ipsum_dir}/${arg_i}.txt" ]; then
        # Name provided matches a .txt file in ipsum_dir (e.g., "test")
        ipsum_file="${ipsum_dir}/${arg_i}.txt"
    fi

    # Fallback words if no file is found
    default_words="lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua ut enim ad minim veniam quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
    
    # Pipe data into awk. If file exists, use it; otherwise use default string.
    {
        if [ -n "$ipsum_file" ] && [ -f "$ipsum_file" ]; then
            cat "$ipsum_file"
        else
            printf "%s" "$default_words"
        fi
    } | awk -v w_range="$arg_w" -v s_range="$arg_s" -v p_count="$arg_p" -v n_start="$no_start" '
    BEGIN {
        srand();
        split(w_range, wr, ","); w_min = wr[1]; w_max = (wr[2] ? wr[2] : wr[1]);
        split(s_range, sr, ","); s_min = sr[1]; s_max = (sr[2] ? sr[2] : sr[1]);
        v_idx = 0;
    }
    {
        for (i=1; i<=NF; i++) {
            vocab[v_idx++] = $i;
        }
    }
    END {
        if (v_idx == 0) exit;

        for (p=1; p<=p_count; p++) {
            paragraph = "";
            s_target = int(rand() * (s_max - s_min + 1)) + s_min;
            
            for (s=1; s<=s_target; s++) {
                sentence = "";
                w_target = int(rand() * (w_max - w_min + 1)) + w_min;
                
                for (w=1; w<=w_target; w++) {
                    word = "";
                    if (p==1 && s==1 && w<=5 && n_start==0) {
                        lorem[1]="Lorem"; lorem[2]="ipsum"; lorem[3]="dolor"; lorem[4]="sit"; lorem[5]="amet";
                        word = lorem[w];
                    } else {
                        word = vocab[int(rand() * v_idx)];
                        if (w==1) word = toupper(substr(word,1,1)) substr(word,2);
                    }
                    
                    if (w > 3 && w < w_target && rand() < 0.12) word = word ",";
                    sentence = (sentence == "" ? word : sentence " " word);
                }
                paragraph = (paragraph == "" ? sentence "." : paragraph "  " sentence ".");
            }
            printf "%s%s", paragraph, (p == p_count ? "" : "\n\n");
        }
        printf "\n";
    }'
}
