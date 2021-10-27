current_time=$(date "+%Y.%m.%d-%H.%M.%S")
#test_env=$(echo "$ENV" | tr '[:upper:]' '[:lower:]')
create_test_plan=$(echo "$1")
#browser=$(echo $BROWSER)
#test_rail_email=$(echo $TESTRAIL_EMAIL)
#test_rail_api_key=$(echo $WEB_TESTRAIL_API_KEY)

echo "Current Time : $current_time"
echo "Create Test Plan : $create_test_plan"
sed "N;s/\"reporterOptions\": {\n.*\"active\": false,/\"reporterOptions\": {\n\t\"active\": $create_test_plan,/" cypress.json >cypress-tmp.json

if [ "$create_test_plan" = true ]; then
TEST_PLAN_INFO=$(
  curl -H "Content-Type: application/json" \
  -u "arth.p@mail.ru:stalker82" \
   "https://integrationcypress.testrail.io/index.php?/api/v2/add_plan/3"\
  -d "{ \"name\": \"Automated Tests for Arthur integration test at $current_time\", \"entries\": [{\"suite_id\": 6, \"name\": \"Smoke\"}, {\"suite_id\": 7, \"name\": \"Extended\"}, {\"suite_id\": 8,
     \"name\": \"Critical\"}]}"
)
dest_dir=./cypress/fixtures/plan-info.json
echo "$TEST_PLAN_INFO" >"$dest_dir"
test_plan_id=$(sed -E 's/.*"plan_id":"?([^,"]*)"?.*/\1/' "$dest_dir")
echo "TestPlanId :$test_plan_id"
sed "s/\"reporterOptions\": {/\"reporterOptions\": { \n\t\"testPlanId\": $test_plan_id,/" cypress-tmp.json>cypress-custom.json
rm cypress-tmp.json
fi