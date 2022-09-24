import re


class MethodTest:
    @staticmethod
    def list_queryset(data, list_=None):
        if isinstance(list_, list):
            for i in data:
                if i in list_:
                    data[i] = list(data[i])
        else:
            for i in data:
                for j in i:
                    if j == list_:
                        i[j] = list(i[j])

        return data

    @staticmethod
    def compare_date(response, result):
        match_result = re.findall(r'[0-9:-]{7,}[^. ]?', result['date'])
        match_response = re.findall(r'[0-9:-]{7,}[^.T]?', response['date'])
        if match_result == match_response:
            return {'result': match_result, 'response': match_response}

        return {'result': result['date'], 'response': response['date']}