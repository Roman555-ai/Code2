#include <stdio.h>
#include <stdlib.h>

// Define number of candidates
#define NUM_CANDIDATES 6

// Define structure for DOB
typedef struct {
    int year;
    int month;
    int day;
} DOB;

// Helper function to calculate age
int calculate_age(DOB dob) {
    int current_year = 2025;
    int current_month = 4;
    int current_day = 21;

    int age = current_year - dob.year;
    if (current_month < dob.month || (current_month == dob.month && current_day < dob.day)) {
        age--;
    }
    return age;
}

int main() {
    char group_name[50];
    char ch;
    int i = 0;

    // Candidate arrays
    char candidate01[100], candidate02[100], candidate03[10], candidate04[100];
    char candidate05[50], candidate06[10], candidate07[50], candidate08[100];
    int candidate09[10]; // Korean Proficiency (TOPIK)
    char candidate10[10], candidate11[300];

    // Store DOB separately to calculate age
    DOB dob_array[NUM_CANDIDATES];

    // Member info labels
    char *member_info[] = {
        "Name", "Date of Birth", "Gender", "Email", "Nationality",
        "BMI", "Primary Skill", "Secondary Skill", "TOPIK", "MBTI", "Self-Introduction"
    };

    printf("Enter Audition Group Name: ");
    int k = 0;
    while ((ch = getchar()) != '\n' && k < 49) {
        group_name[k++] = ch;
    }
    group_name[k] = '\0';

    printf("####################################\n");
    printf("[%s] Audition Candidate Data Entry\n", group_name);
    printf("####################################\n");

    while (i < NUM_CANDIDATES) {
        printf("Entering information for candidate %d.\n", i + 1);
        printf("---------------------------------\n");

        printf("1. Name: ");
        fgets(candidate01, sizeof(candidate01), stdin);

        printf("2. Date of Birth (YYYY/MM/DD format): ");
        scanf("%d/%d/%d", &dob_array[i].year, &dob_array[i].month, &dob_array[i].day);
        getchar(); // Consume newline

        printf("3. Gender (F/M): ");
        fgets(candidate03, sizeof(candidate03), stdin);

        printf("4. Email: ");
        fgets(candidate04, sizeof(candidate04), stdin);

        printf("5. Nationality: ");
        fgets(candidate05, sizeof(candidate05), stdin);

        printf("6. BMI: ");
        fgets(candidate06, sizeof(candidate06), stdin);

        printf("7. Primary Skill: ");
        fgets(candidate07, sizeof(candidate07), stdin);

        printf("8. Secondary Skill: ");
        fgets(candidate08, sizeof(candidate08), stdin);

        printf("9. Korean Proficiency Level (TOPIK): ");
        scanf("%d", &candidate09[i]);
        getchar();

        printf("10. MBTI: ");
        fgets(candidate10, sizeof(candidate10), stdin);

        printf("11. Introduction: ");
        fgets(candidate11, sizeof(candidate11), stdin);

        i++;
        printf("=================================\n");
    }

    // Display Section
    printf("\n####################################\n");
    printf("[%s] Audition Candidate Data Review \n", group_name);
    printf("####################################\n");

    printf("==============================================================================================================\n");
    printf("Name (Age)        | DOB       | Gender | Email               | Nationality   | BMI  | Primary | Secondary     | TOPIK  | MBTI |\n");
    printf("==============================================================================================================\n");

    for (i = 0; i < NUM_CANDIDATES; i++) {
        int age = calculate_age(dob_array[i]);
        printf("%-16s (%d)| %04d%02d%02d | %-6s | %-20s | %-13s | %-5s| %-8s | %-14s | ",
            candidate01, age, dob_array[i].year, dob_array[i].month, dob_array[i].day,
            candidate03, candidate04, candidate05, candidate06, candidate07, candidate08);

        if (candidate09[i] == 0)
            printf("Native | ");
        else
            printf("%-6d | ", candidate09[i]);

        printf("%-5s|\n", candidate10);

        printf("-------------------------------------------------------------------------------------\n");
        printf("%s", candidate11);
        printf("---------------------------------------------------------------------------------------------\n");
    }

    return 0;
}
