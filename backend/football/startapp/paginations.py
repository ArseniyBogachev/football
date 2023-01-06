from rest_framework.pagination import PageNumberPagination, Response


class ArticlesListPagination(PageNumberPagination):
    page_size = 4
    page_size_query_param = 'page_size'
    max_page_size = 10000

    def get_paginated_response(self, data):
        if self.request.query_params:
            return Response({
                'links': {
                    'next': self.get_next_link(),
                    'previous': self.get_previous_link(),
                },
                'count': self.page.paginator.count,
                'results': data
            })
